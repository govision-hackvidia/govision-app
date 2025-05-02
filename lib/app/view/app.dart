import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:govision/core/core.dart';
import 'package:govision/features/camera/bloc/enviroscan/enviroscan_bloc.dart';
import 'package:govision/features/dashboard/dashboard.dart';
import 'package:govision/features/lumen/lumen.dart';
import 'package:govision/injector/injector.dart';
import 'package:govision/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final EnviroscanBloc _enviroscanBloc;
  late final LumenBloc _lumenBloc;

  @override
  void initState() {
    _enviroscanBloc = Injector.instance<EnviroscanBloc>();
    _lumenBloc = Injector.instance<LumenBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EnviroscanBloc>.value(value: _enviroscanBloc),
        BlocProvider<LumenBloc>.value(value: _lumenBloc),
      ],
      child: const _AppBody(),
    );
  }
}

class _AppBody extends StatelessWidget {
  const _AppBody();

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
