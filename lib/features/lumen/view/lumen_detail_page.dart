import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:govision/core/core.dart';
import 'package:govision/data/models/models.dart';
import 'package:govision/features/lumen/lumen.dart';
import 'package:govision/widgets/widgets.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class LumenDetailPage extends StatefulWidget {
  const LumenDetailPage({super.key, this.conversations = const []});

  final List<ChatModel> conversations;

  @override
  State<LumenDetailPage> createState() => _LumenDetailPageState();
}

class _LumenDetailPageState extends State<LumenDetailPage> {
  final _scrollController = ScrollController();
  final _voiceService = VoiceService();
  final List<ChatModel> _conversations = [];

  @override
  void initState() {
    super.initState();
    _voiceService.initSpeech();
    _loadInitialMessages();
  }

  void _loadInitialMessages() {
    _conversations.addAll(widget.conversations);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _voiceService.dispose();
    super.dispose();
  }

  Future<void> _onSpeechResult(SpeechRecognitionResult result) async {
    if (!result.finalResult) return;

    final text = result.recognizedWords.trim();
    if (text.isEmpty) return;

    // add user message
    _addMessage(text, false);

    // stop listening
    await _voiceService.stopListening();

    // show typing
    _addMessage(typingMessage, true);

    // dispatch to bloc
    context.read<LumenBloc>().add(LumenEvent.sendText(text));
  }

  void _addMessage(String msg, bool isAnswer) {
    setState(() {
      _conversations.insert(0, ChatModel(message: msg, isAnswer: isAnswer));
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
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.backgroundGray,
      appBar: AppBar(
        title: const Text(
          'What is your opinion about this event?',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: MoreCircleWidget(),
          ),
        ],
      ),
      body: BlocListener<LumenBloc, LumenState>(
        listener: (context, state) {
          state.text.maybeWhen(
            loading: () {},
            orElse: () {
              _removeTyping();
            },
          );

          state.text.when(
            initial: () {},
            loading: () {},
            error: (message) {
              _addMessage('Oops, something went wrong.', true);
            },
            data: (answer) async {
              _addMessage(answer, true);
              await _voiceService.speak(answer);
            },
          );
        },
        child: Stack(
          children: [
            _buildChatList(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewPadding.bottom + 16,
                ),
                child: ValueListenableBuilder<bool>(
                  valueListenable: _voiceService.isListening,
                  builder: (context, isListening, _) {
                    return MicButtonWidget(
                      isListening: isListening,
                      onStart:
                          () => _voiceService.startListening(_onSpeechResult),
                      onStop: _voiceService.stopListening,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      reverse: true,
      controller: _scrollController,
      padding: EdgeInsets.only(
        top: 24,
        bottom: MediaQuery.of(context).viewPadding.bottom + 100,
      ),
      itemCount: _conversations.length,
      itemBuilder:
          (context, index) => ChatMessageWidget(chat: _conversations[index]),
    );
  }
}
