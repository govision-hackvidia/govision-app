import 'package:flutter/material.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/dashboard/dashboard.dart';
import 'package:govision/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      colorTheme: AppColors.colors(),
      textTheme: AppTextStyles.textStyles(),
      child: MaterialApp(
        title: 'GoVision',
        theme: AppThemeData.themeData().themeData,
        darkTheme: AppThemeData.themeData().themeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const DashboardPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
