import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/auth/auth.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:govision/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Scaffold(
      backgroundColor: colors.backgroundGray2,
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Assets.images.profile.image(),
                  12.horizontal,
                  Text('Hibatullah Hana', style: textTheme.body1SemiBold),
                ],
              ),
            ),
            16.vertical,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Assets.icons.account.svg(),
                        12.horizontal,
                        Text('Profile', style: textTheme.body2SemiBold),
                        const Spacer(),
                        Assets.icons.right.svg(),
                      ],
                    ),
                  ),
                  16.vertical,
                  Divider(color: colors.borderGray, height: 1),
                  16.vertical,
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Assets.icons.language.svg(),
                        12.horizontal,
                        Text('Language', style: textTheme.body2SemiBold),
                        const Spacer(),
                        Assets.icons.right.svg(),
                      ],
                    ),
                  ),
                  16.vertical,
                  Divider(color: colors.borderGray, height: 1),
                  16.vertical,
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Assets.icons.notification.svg(),
                        12.horizontal,
                        Text('Notification', style: textTheme.body2SemiBold),
                        const Spacer(),
                        Assets.icons.right.svg(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.vertical,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text('Help Centre', style: textTheme.body2SemiBold),
                        const Spacer(),
                        Assets.icons.right.svg(),
                      ],
                    ),
                  ),
                  16.vertical,
                  Divider(color: colors.borderGray, height: 1),
                  16.vertical,
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text('Talk to GoVision', style: textTheme.body2SemiBold),
                        const Spacer(),
                        Assets.icons.right.svg(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.vertical,
            GestureDetector(
              onTap: () {
                pushAndRemoveUntilTransition(
                  context,
                  LoginPage(),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Assets.icons.logout.svg(),
                        12.horizontal,
                        Text(
                          'Log Out',
                          style: textTheme.body2SemiBold.copyWith(
                            color: colors.danger,
                          ),
                        ),
                        const Spacer(),
                        Assets.icons.right.svg(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
