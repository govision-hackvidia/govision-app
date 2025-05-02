import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    required this.textTheme,
    required this.colorTheme,
    required super.child,
    super.key,
  });

  final AppTextStyles textTheme;
  final AppColors colorTheme;

  // Static method to access the theme from context
  static AppTheme? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

/// Extension on BuildContext for easy theme access
extension ThemeExtension on BuildContext {
  AppTheme get themes {
    final theme = AppTheme.of(this);
    assert(theme != null, 'No AppTheme found in context');
    return theme!;
  }

  AppColors get colors {
    final theme = AppTheme.of(this);
    assert(theme != null, 'No AppTheme found in context');
    return theme!.colorTheme;
  }

  AppTextStyles get textTheme {
    final theme = AppTheme.of(this);
    assert(theme != null, 'No AppTheme found in context');
    return theme!.textTheme;
  }
}

///////////////////////////
///                     ///
///      COLORS         ///
///                     ///
///////////////////////////
class AppColors {
  const AppColors(
      this.primary,
      this.secondary,
      this.warning,
      this.danger,
      this.borderGray,
      this.border50,
      this.red,
      this.secondaryBlue,
      this.gray,
      this.gray2,
      this.captionGray,
      this.secondaryGray,
      this.backgroundGray,
      this.backgroundGray2,
      this.neutral50,
      );

  factory AppColors.colors() {
    const primary = Color(0xFF007AFF);
    const secondary = Color(0xFFF4A261);
    const warning = Color(0xFFFDDB97);
    const danger = Color(0xFFEB5757);

    const borderGray = Color(0xFFEEEEEE);
    const border50 = Color(0xFF929292);

    const red = Color(0xFFFF5313);

    const secondaryBlue = Color(0xFF4289F0);

    const gray = Color(0xFFF3F3F3);
    const gray2 = Color(0xFF333333);
    const captionGray = Color(0xFFA7A5B6);
    const secondaryGray = Color(0xFF797979);
    const backgroundGray = Color(0xFFF6F7F9);
    const backgroundGray2 = Color(0xFFF3F3F3);

    const neutral50 = Color(0xFFFAFAFA);

    return const AppColors(
      primary,
      secondary,
      warning,
      danger,
      borderGray,
      border50,
      red,
      secondaryBlue,
      gray,
      gray2,
      captionGray,
      secondaryGray,
      backgroundGray,
      backgroundGray2,
      neutral50,
    );
  }

  static AppColors of(BuildContext context) {
    final inheritedWidget =
    context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(inheritedWidget != null, 'No AppTheme found in context');
    return inheritedWidget!.colorTheme;
  }

  final Color primary;
  final Color secondary;
  final Color warning;
  final Color danger;
  final Color borderGray;
  final Color border50;
  final Color red;
  final Color secondaryBlue;
  final Color gray;
  final Color gray2;
  final Color captionGray;
  final Color secondaryGray;
  final Color backgroundGray;
  final Color backgroundGray2;
  final Color neutral50;
}

///////////////////////////
///                     ///
///     Text Style      ///
///                     ///
///////////////////////////
class AppTextStyles {
  AppTextStyles(
      this.displayLarge,
      this.displayMedium,
      this.displaySmall,
      this.headlineLarge,
      this.headlineMedium,
      this.headlineSmall,
      this.titleLarge,
      this.titleMedium,
      this.titleSmall,
      this.labelLarge,
      this.labelMedium,
      this.labelSmall,
      this.bodyLarge,
      this.bodyMedium,
      this.bodySmall,
      this.captionLarge,
      this.captionMedium,
      this.captionSmall,
      this.display1Regular,
      this.display1Medium,
      this.display1SemiBold,
      this.display1Bold,
      this.display2Regular,
      this.display2Medium,
      this.display2SemiBold,
      this.display2Bold,
      this.headingRegular,
      this.headingMedium,
      this.headingSemiBold,
      this.headingBold,
      this.headline1Regular,
      this.headline1Medium,
      this.headline1SemiBold,
      this.headline1Bold,
      this.headline2Regular,
      this.headline2Medium,
      this.headline2SemiBold,
      this.headline2Bold,
      this.headline3Regular,
      this.headline3Medium,
      this.headline3SemiBold,
      this.headline3Bold,
      this.headline4Regular,
      this.headline4Medium,
      this.headline4SemiBold,
      this.headline4Bold,
      this.body1Regular,
      this.body1Medium,
      this.body1SemiBold,
      this.body1Bold,
      this.body2Regular,
      this.body2Medium,
      this.body2SemiBold,
      this.body2Bold,
      this.caption1Regular,
      this.caption1Medium,
      this.caption1SemiBold,
      this.caption1Bold,
      this.caption2Regular,
      this.caption2Medium,
      this.caption2SemiBold,
      this.caption2Bold,
      this.smallCaption1Regular,
      this.smallCaption1Medium,
      this.smallCaption1SemiBold,
      this.smallCaption1Bold,
      this.smallCaption2Regular,
      this.smallCaption2Medium,
      this.smallCaption2SemiBold,
      this.smallCaption2Bold,
      );

  factory AppTextStyles.textStyles() {
    final headlineLarge = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final headlineMedium = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final headlineSmall = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final titleLarge = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final titleMedium = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final titleSmall = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final labelLarge = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final labelMedium = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final labelSmall = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final bodyLarge = GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final bodyMedium = GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final bodySmall = GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final captionLarge = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.5,
      color: Colors.black,
    );

    final captionMedium = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.5,
      color: Colors.black,
    );

    final captionSmall = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.5,
      color: Colors.black,
    );

    final display1Regular = GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final display1Medium = GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final display1SemiBold = GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final display1Bold = GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final display2Regular = GoogleFonts.inter(
      fontSize: 40,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final display2Medium = GoogleFonts.inter(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final display2SemiBold = GoogleFonts.inter(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final display2Bold = GoogleFonts.inter(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final headingRegular = GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final headingMedium = GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final headingSemiBold = GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final headingBold = GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final headline1Regular = GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final headline1Medium = GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final headline1SemiBold = GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final headline1Bold = GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final headline2Regular = GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final headline2Medium = GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final headline2SemiBold = GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final headline2Bold = GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final headline3Regular = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final headline3Medium = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final headline3SemiBold = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final headline3Bold = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final headline4Regular = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final headline4Medium = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final headline4SemiBold = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final headline4Bold = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final body1Regular = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final body1Medium = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final body1SemiBold = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final body1Bold = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final body2Regular = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final body2Medium = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final body2SemiBold = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final body2Bold = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final caption1Regular = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final caption1Medium = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final caption1SemiBold = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final caption1Bold = GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final caption2Regular = GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final caption2Medium = GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final caption2SemiBold = GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final caption2Bold = GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final smallCaption1Regular = GoogleFonts.inter(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final smallCaption1Medium = GoogleFonts.inter(
      fontSize: 8,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final smallCaption1SemiBold = GoogleFonts.inter(
      fontSize: 8,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final smallCaption1Bold = GoogleFonts.inter(
      fontSize: 8,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final smallCaption2Regular = GoogleFonts.inter(
      fontSize: 7,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    final smallCaption2Medium = GoogleFonts.inter(
      fontSize: 7,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final smallCaption2SemiBold = GoogleFonts.inter(
      fontSize: 7,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final smallCaption2Bold = GoogleFonts.inter(
      fontSize: 7,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final displayLarge = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final displayMedium = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    final displaySmall = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    return AppTextStyles(
      displayLarge,
      displayMedium,
      displaySmall,
      headlineLarge,
      headlineMedium,
      headlineSmall,
      titleLarge,
      titleMedium,
      titleSmall,
      labelLarge,
      labelMedium,
      labelSmall,
      bodyLarge,
      bodyMedium,
      bodySmall,
      captionLarge,
      captionMedium,
      captionSmall,
      display1Regular,
      display1Medium,
      display1SemiBold,
      display1Bold,
      display2Regular,
      display2Medium,
      display2SemiBold,
      display2Bold,
      headingRegular,
      headingMedium,
      headingSemiBold,
      headingBold,
      headline1Regular,
      headline1Medium,
      headline1SemiBold,
      headline1Bold,
      headline2Regular,
      headline2Medium,
      headline2SemiBold,
      headline2Bold,
      headline3Regular,
      headline3Medium,
      headline3SemiBold,
      headline3Bold,
      headline4Regular,
      headline4Medium,
      headline4SemiBold,
      headline4Bold,
      body1Regular,
      body1Medium,
      body1SemiBold,
      body1Bold,
      body2Regular,
      body2Medium,
      body2SemiBold,
      body2Bold,
      caption1Regular,
      caption1Medium,
      caption1SemiBold,
      caption1Bold,
      caption2Regular,
      caption2Medium,
      caption2SemiBold,
      caption2Bold,
      smallCaption1Regular,
      smallCaption1Medium,
      smallCaption1SemiBold,
      smallCaption1Bold,
      smallCaption2Regular,
      smallCaption2Medium,
      smallCaption2SemiBold,
      smallCaption2Bold,
    );
  }

  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;

  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;

  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  final TextStyle captionLarge;
  final TextStyle captionMedium;
  final TextStyle captionSmall;

  final TextStyle display1Regular;
  final TextStyle display1Medium;
  final TextStyle display1SemiBold;
  final TextStyle display1Bold;

  final TextStyle display2Regular;
  final TextStyle display2Medium;
  final TextStyle display2SemiBold;
  final TextStyle display2Bold;

  final TextStyle headingRegular;
  final TextStyle headingMedium;
  final TextStyle headingSemiBold;
  final TextStyle headingBold;

  final TextStyle headline1Regular;
  final TextStyle headline1Medium;
  final TextStyle headline1SemiBold;
  final TextStyle headline1Bold;

  final TextStyle headline2Regular;
  final TextStyle headline2Medium;
  final TextStyle headline2SemiBold;
  final TextStyle headline2Bold;

  final TextStyle headline3Regular;
  final TextStyle headline3Medium;
  final TextStyle headline3SemiBold;
  final TextStyle headline3Bold;

  final TextStyle headline4Regular;
  final TextStyle headline4Medium;
  final TextStyle headline4SemiBold;
  final TextStyle headline4Bold;

  final TextStyle body1Regular;
  final TextStyle body1Medium;
  final TextStyle body1SemiBold;
  final TextStyle body1Bold;

  final TextStyle body2Regular;
  final TextStyle body2Medium;
  final TextStyle body2SemiBold;
  final TextStyle body2Bold;

  final TextStyle caption1Regular;
  final TextStyle caption1Medium;
  final TextStyle caption1SemiBold;
  final TextStyle caption1Bold;

  final TextStyle caption2Regular;
  final TextStyle caption2Medium;
  final TextStyle caption2SemiBold;
  final TextStyle caption2Bold;

  final TextStyle smallCaption1Regular;
  final TextStyle smallCaption1Medium;
  final TextStyle smallCaption1SemiBold;
  final TextStyle smallCaption1Bold;

  final TextStyle smallCaption2Regular;
  final TextStyle smallCaption2Medium;
  final TextStyle smallCaption2SemiBold;
  final TextStyle smallCaption2Bold;
}

/// The theme data for this application.
/// Use this theme data for requiring style, such as AppBar, ElevatedButton, etc.
class AppThemeData {
  const AppThemeData({
    required this.themeData,
  });

  factory AppThemeData.themeData() {
    final appColors = AppColors.colors();
    final appTextStyles = AppTextStyles.textStyles();

    final primaryColor = appColors.primary;
    final primaryColorMap = <int, Color>{
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };

    final primaryMaterialColor = MaterialColor(
      primaryColor.value,
      primaryColorMap,
    );

    final themeData = ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      primarySwatch: primaryMaterialColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: appColors.primary,
        secondary: appColors.secondary,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
      indicatorColor: Colors.black,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
      // actionIconTheme: ActionIconThemeData(
      //   backButtonIconBuilder: (context) => Assets.icons.arrowLeft.svg(),
      // ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        // surfaceTintColor: Color(0xFF141414),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: appTextStyles.displayLarge,
        displayMedium: appTextStyles.displayMedium,
        displaySmall: appTextStyles.displaySmall,
        headlineLarge: appTextStyles.headlineLarge,
        headlineMedium: appTextStyles.headlineMedium,
        headlineSmall: appTextStyles.headlineSmall,
        titleLarge: appTextStyles.titleLarge,
        titleMedium: appTextStyles.titleMedium,
        titleSmall: appTextStyles.titleSmall,
        labelLarge: appTextStyles.captionLarge,
        labelMedium: appTextStyles.captionMedium,
        labelSmall: appTextStyles.captionSmall,
        bodyLarge: appTextStyles.bodyLarge,
        bodyMedium: appTextStyles.bodyMedium,
        bodySmall: appTextStyles.bodySmall,
      ),
    );

    return AppThemeData(
      themeData: themeData,
    );
  }

  final ThemeData? themeData;
}

void statusBarDarkStyle() {
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayDarkStyle);
}

SystemUiOverlayStyle get systemUiOverlayDarkStyle {
  return const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}

class NoOverScrollEffectBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return child;
  }
}
