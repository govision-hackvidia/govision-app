import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/gen/assets.gen.dart';

class EditCircleWidget extends StatelessWidget {
  const EditCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: colors.neutral50,
        shape: BoxShape.circle,
        border: Border.all(
          color: colors.border50.withOpacity(0.15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Assets.icons.edit.svg(),
      ),
    );
  }
}
