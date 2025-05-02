import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/data/models/models.dart';
import 'package:govision/gen/assets.gen.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({required this.chat, super.key});

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final isAnswer = chat.isAnswer ?? false;
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: isAnswer ? 24 : 0,
        bottom: isAnswer ? 24 : 0,
      ),
      child: Align(
        alignment: isAnswer ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          margin:
              isAnswer
                  ? const EdgeInsets.only(right: 34)
                  : const EdgeInsets.only(left: 34),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isAnswer ? Colors.white : colors.primary,
            border: Border.all(
              color: isAnswer ? colors.borderGray : colors.primary,
            ),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: isAnswer ? Radius.zero : const Radius.circular(12),
              bottomRight: isAnswer ? const Radius.circular(12) : Radius.zero,
            ),
          ),
          child:
              chat.message != typingMessage
                  ? Text(
                    chat.message ?? '',
                    style: textTheme.caption1Regular.copyWith(
                      color: isAnswer ? Colors.black : Colors.white,
                    ),
                  )
                  : Assets.lottie.typing.lottie(width: 24, height: 24),
        ),
      ),
    );
  }
}
