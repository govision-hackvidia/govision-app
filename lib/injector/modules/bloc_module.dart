import 'package:govision/features/camera/bloc/enviroscan/enviroscan_bloc.dart';
import 'package:govision/injector/injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<EnviroscanBloc>(
      () => EnviroscanBloc(repository: injector()),
    );
  }
}
