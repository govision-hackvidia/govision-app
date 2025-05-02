import 'package:govision/core/core.dart';
import 'package:govision/injector/injector.dart';

class ClientModule {
  ClientModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerLazySingleton<DioClient>(DioClient.new);
  }
}
