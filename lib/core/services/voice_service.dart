import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceService {
  final _speechToText = SpeechToText();
  final _flutterTts = FlutterTts();

  final ValueNotifier<bool> isListening = ValueNotifier(false);

  Future<void> initSpeech() async {
    await _speechToText.initialize();
  }

  Future<void> startListening(
    void Function(SpeechRecognitionResult) onResult,
  ) async {
    isListening.value = true;
    await _speechToText.listen(onResult: onResult);
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
    isListening.value = false;
  }

  Future<void> speak(String text) async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(1);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak(text);
  }

  void dispose() {
    _speechToText.stop();
    _speechToText.cancel();
    _flutterTts.stop();
    isListening.dispose();
  }
}
