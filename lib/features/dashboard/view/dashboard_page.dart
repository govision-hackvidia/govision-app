import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/camera/camera.dart';
import 'package:govision/features/home/home.dart';
import 'package:govision/features/lumen/lumen.dart';
import 'package:govision/features/news/news.dart';
import 'package:govision/features/profile/profile.dart';
import 'package:govision/gen/assets.gen.dart';
import 'package:govision/utils/navigator/navigator.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final _pages = const [
    HomePage(),
    LumenPage(),
    SizedBox(),
    NewsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      pushTransition(context, const CameraPage());
      return;
    }
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    BottomNavigationBarItem buildItem({
      required Widget icon,
      required Widget activeIcon,
      required String label,
      required bool isActive,
    }) {
      return BottomNavigationBarItem(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive) activeIcon else icon,
            const SizedBox(height: 4),
            Text(
              label,
              style: textTheme.caption1Medium.copyWith(
                color: isActive ? colors.primary : colors.secondaryGray,
              ),
            ),
          ],
        ),
        label: '',
      );
    }

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.secondaryGray,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          buildItem(
            icon: Assets.icons.home.svg(
              colorFilter: ColorFilter.mode(
                colors.secondaryGray,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: Assets.icons.home.svg(
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
            label: 'Home',
            isActive: _selectedIndex == 0,
          ),
          buildItem(
            icon: Assets.icons.talk.svg(
              colorFilter: ColorFilter.mode(
                colors.secondaryGray,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: Assets.icons.talk.svg(
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
            label: 'Talk',
            isActive: _selectedIndex == 1,
          ),
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Open Camera',
          ),
          buildItem(
            icon: Assets.icons.news.svg(
              colorFilter: ColorFilter.mode(
                colors.secondaryGray,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: Assets.icons.news.svg(
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
            label: 'News',
            isActive: _selectedIndex == 3,
          ),
          buildItem(
            icon: Assets.icons.profile.svg(
              colorFilter: ColorFilter.mode(
                colors.secondaryGray,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: Assets.icons.profile.svg(
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
            label: 'Profile',
            isActive: _selectedIndex == 4,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () {
              pushTransition(context, const CameraPage());
            },
            elevation: 0,
            shape: const CircleBorder(),
            backgroundColor: colors.primary,
            child: Semantics(
              label: 'Open Camera',
              child: Assets.icons.camera.svg(),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
