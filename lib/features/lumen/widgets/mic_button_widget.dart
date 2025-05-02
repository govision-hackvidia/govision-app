import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:govision/utils/utils.dart';

class MicButtonWidget extends StatelessWidget {
  const MicButtonWidget({
    required this.isListening,
    required this.onStart,
    required this.onStop,
    super.key,
  });

  final bool isListening;
  final VoidCallback onStart;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: isListening ? onStop : onStart,
      style: ElevatedButton.styleFrom(
        backgroundColor: isListening ? colors.red : colors.primary,
        minimumSize: Size(screenWidth / 2, 58),
        maximumSize: Size(screenWidth / 2, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isListening)
            Assets.icons.close.svg()
          else
            Assets.icons.microphone.svg(),
          10.horizontal,
          Text(
            isListening ? 'Stop' : 'Start speaking',
            style: textTheme.body1SemiBold.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
