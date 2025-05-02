import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/utils/utils.dart';

class QuoteBlockWidget extends StatelessWidget {
  const QuoteBlockWidget({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: colors.secondaryBlue,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(4),
              ),
            ),
          ),
          12.horizontal,
          Expanded(
            child: Text(
              text,
              style: textTheme.body2SemiBold.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
