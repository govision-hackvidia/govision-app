import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:govision/core/core.dart';
import 'package:govision/data/models/models.dart';
import 'package:govision/features/camera/bloc/enviroscan/enviroscan_bloc.dart';
import 'package:govision/features/camera/camera.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, this.isWalkingGuide = true});

  final bool isWalkingGuide;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late final CameraController _controller;
  final VoiceService _voiceService = VoiceService();
  final ScrollController _scrollController = ScrollController();
  late bool _isWalkingGuide;
  bool _isPanelExpanded = false;
  final List<ChatModel> _conversations = [];

  @override
  void initState() {
    super.initState();
    _isWalkingGuide = widget.isWalkingGuide;
    _initialize();
  }

  Future<void> _initialize() async {
    await _initializeCamera();
    await _initializeVoice();
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.max,
      enableAudio: false,
    );
    try {
      await _controller.initialize();
      if (mounted) setState(() {});
    } on CameraException {
      // Handle camera errors if needed
    }
  }

  Future<void> _initializeVoice() async {
    await _voiceService.initSpeech();
    _voiceService.isListening.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _voiceService.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSwipe(double velocity) {
    setState(() {
      if (velocity < -300) {
        _isPanelExpanded = true;
      } else if (velocity > 300) {
        _isPanelExpanded = false;
      }
    });
  }

  Future<void> _onSpeechResult(SpeechRecognitionResult result) async {
    final text = result.recognizedWords.trim();
    if (result.finalResult && text.isNotEmpty) {
      _addMessage(text, false);
      await _voiceService.stopListening();

      context.read<EnviroscanBloc>().add(
        EnviroscanEvent.sendScan(text, await _captureImage()),
      );
    }
  }

  Future<File> _captureImage() async {
    final xFile = await _controller.takePicture();
    return File(xFile.path);
  }

  void _addMessage(String text, bool isAnswer) {
    setState(() {
      _conversations.insert(0, ChatModel(message: text, isAnswer: isAnswer));
    });
    _scrollToTop();
  }

  void _removeTyping() {
    setState(() {
      _conversations.removeWhere((m) => m.message == typingMessage);
    });
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) return const SizedBox.shrink();
    final colors = context.colors;
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocListener<EnviroscanBloc, EnviroscanState>(
          listener: (context, state) async {
            state.text.when(
              initial: () {},
              loading: () => _addMessage(typingMessage, true),
              data: (text) async {
                _removeTyping();
                _addMessage(text, true);
                await _voiceService.speak(text);
              },
              error: (err) {
                _removeTyping();
                _addMessage('Error: $err', true);
              },
            );
          },
          child: Stack(
            children: [
              CameraPreviewWidget(controller: _controller),
              const BackButtonOverlay(),
              ModeToggleOverlay(
                isWalking: _isWalkingGuide,
                onToggle:
                    () => setState(() => _isWalkingGuide = !_isWalkingGuide),
              ),
              if (_isWalkingGuide)
                ChatPanel(
                  conversations: _conversations,
                  scrollController: _scrollController,
                  isExpanded: _isPanelExpanded,
                  onSwipe: _handleSwipe,
                ),
              if (_isWalkingGuide)
                MicControl(
                  isListening: _voiceService.isListening.value,
                  onStart: () => _voiceService.startListening(_onSpeechResult),
                  onStop: _voiceService.stopListening,
                  bottomPadding: bottomInset,
                  primaryColor: colors.primary,
                  dangerColor: colors.danger,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CameraPreviewWidget extends StatelessWidget {
  const CameraPreviewWidget({required this.controller, super.key});

  final CameraController controller;

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: controller.value.previewSize!.height,
        height: controller.value.previewSize!.width,
        child: CameraPreview(controller),
      ),
    ),
  );
}

class BackButtonOverlay extends StatelessWidget {
  const BackButtonOverlay({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
    top: 32,
    left: 24,
    child: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        child: Semantics(
          label: 'Back',
          child: Assets.icons.arrow.svg(width: 24, height: 24),
        ),
      ),
    ),
  );
}

class ModeToggleOverlay extends StatelessWidget {
  const ModeToggleOverlay({
    required this.isWalking,
    required this.onToggle,
    super.key,
  });

  final bool isWalking;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Positioned(
      top: 32,
      right: 24,
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: isWalking ? colors.primary : Colors.white,
              child: Semantics(
                label: 'EnviroScan',
                child: Assets.icons.aiPortrait.svg(
                  colorFilter: ColorFilter.mode(
                    isWalking ? Colors.white : colors.secondaryGray,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onToggle,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: isWalking ? Colors.white : colors.primary,
              child: Semantics(
                label: 'HazAlert',
                child: Assets.icons.danger.svg(
                  colorFilter: ColorFilter.mode(
                    isWalking ? colors.secondaryGray : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPanel extends StatelessWidget {
  const ChatPanel({
    required this.conversations,
    required this.scrollController,
    required this.isExpanded,
    required this.onSwipe,
    super.key,
  });

  final List<ChatModel> conversations;
  final ScrollController scrollController;
  final bool isExpanded;
  final void Function(double) onSwipe;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragEnd:
            (details) => onSwipe(details.velocity.pixelsPerSecond.dy),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          height: isExpanded ? MediaQuery.of(context).size.height * 0.7 : 132,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 12,
              bottom:
                  isExpanded
                      ? MediaQuery.of(context).viewPadding.bottom + 100
                      : 16,
            ),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isExpanded
                          ? 'Swipe Down to Hide'
                          : 'Swipe Up to See Chat',
                      style: textTheme.caption1Regular.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Transform.rotate(
                      angle: isExpanded ? -3.14 / 2 : 3.14 / 2,
                      child: Semantics(
                        label: 'Swipe Arrow',
                        child: Assets.icons.arrow.svg(
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.8),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      controller: scrollController,
                      itemCount: conversations.length,
                      itemBuilder:
                          (_, i) =>
                              ChatMessageCameraWidget(chat: conversations[i]),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MicControl extends StatelessWidget {
  const MicControl({
    required this.isListening,
    required this.onStart,
    required this.onStop,
    required this.bottomPadding,
    required this.primaryColor,
    required this.dangerColor,
    super.key,
  });

  final bool isListening;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final double bottomPadding;
  final Color primaryColor;
  final Color dangerColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16 + bottomPadding,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: 64,
          height: 64,
          child: ElevatedButton(
            onPressed: isListening ? onStop : onStart,
            style: ElevatedButton.styleFrom(
              backgroundColor: isListening ? dangerColor : primaryColor,
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
            ),
            child: Semantics(
              label: isListening ? 'Stop Speaking' : 'Start Speaking',
              child:
                  isListening
                      ? Assets.icons.close.svg(
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      )
                      : Assets.icons.microphoneActive.image(
                        color: Colors.white,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
