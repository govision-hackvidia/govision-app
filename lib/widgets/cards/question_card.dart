import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:govision/utils/utils.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({required this.question, required this.answer, super.key});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Semantics(
      hint: 'Double tap to open question',
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colors.gray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Assets.icons.message.svg(),
              ),
            ),
            12.horizontal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: textTheme.body2SemiBold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  2.vertical,
                  Text(
                    answer,
                    style: textTheme.caption1Regular.copyWith(
                      color: colors.secondaryGray,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
