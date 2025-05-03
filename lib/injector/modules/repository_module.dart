import 'package:govision/data/data.dart';
import 'package:govision/injector/injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<EnviroscanRepository>(
      () => EnviroscanRepositoryImpl(client: injector()),
    );

    injector.registerFactory<HazalertRepository>(
      () => HazalertRepositoryImpl(client: injector()),
    );

    injector.registerFactory<LumenRepository>(
      () => LumenRepositoryImpl(client: injector()),
    );

    injector.registerFactory<NewsRepository>(NewsRepositoryImpl.new);
  }
}
