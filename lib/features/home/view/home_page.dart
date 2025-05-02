import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/camera/camera.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:govision/utils/utils.dart';
import 'package:govision/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 24,
          top: MediaQuery.of(context).viewPadding.top + 24,
          right: 24,
          bottom: 24,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MoreCircleWidget(),
                Assets.icons.govision.svg(),
                const EditCircleWidget(),
              ],
            ),
            60.vertical,
            Semantics(
              label: 'Blind person walking with a dog in park',
              readOnly: true,
              child: Assets.illustrations.dogHelpingBlindMan.svg(),
            ),
            48.vertical,
            Text(
              'Providing the Best Solutions For You',
              style: textTheme.headline1SemiBold,
              textAlign: TextAlign.center,
            ),
            16.vertical,
            Text(
              'GoVision can be your guide. Just give commands to GoVision!',
              style: textTheme.body2Regular.copyWith(
                color: colors.secondaryGray,
              ),
              textAlign: TextAlign.center,
            ),
            24.vertical,
            ElevatedButton(
              onPressed: () {
                pushTransition(
                  context,
                  const CameraPage(isWalkingGuide: true),
                  rootNavigator: true,
                );
              },
              child: const Text('Guide Me Walking'),
            ),
            16.vertical,
            ElevatedButton(
              onPressed: () {
                pushTransition(
                  context,
                  const CameraPage(isWalkingGuide: false),
                  rootNavigator: true,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: colors.primary,
                side: BorderSide(color: colors.primary),
              ),
              child: const Text("What's Ahead of Me?"),
            ),
          ],
        ),
      ),
    );
  }
}
