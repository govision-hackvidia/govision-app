import 'package:govision/features/camera/camera.dart';
import 'package:govision/features/lumen/lumen.dart';
import 'package:govision/features/news/news.dart';
import 'package:govision/injector/injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<EnviroscanBloc>(
      () => EnviroscanBloc(repository: injector()),
    );

    injector.registerFactory<HazalertBloc>(
      () => HazalertBloc(repository: injector()),
    );

    injector.registerFactory<LumenBloc>(
      () => LumenBloc(repository: injector()),
    );

    injector.registerFactory<NewsBloc>(() => NewsBloc(repository: injector()));
  }
}
