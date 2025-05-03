import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:govision/core/bloc/async_value.dart';
import 'package:govision/data/repositories/remote/hazalert/hazalert_repository.dart';

part 'hazalert_bloc.freezed.dart';
part 'hazalert_event.dart';
part 'hazalert_state.dart';

class HazalertBloc extends Bloc<HazalertEvent, HazalertState> {
  HazalertBloc({required HazalertRepository repository})
    : _repository = repository,
      super(const HazalertState()) {
    on<_Hazalert>(_onHazalert);
  }

  final HazalertRepository _repository;

  Future<void> _onHazalert(_Hazalert event, Emitter<HazalertState> emit) async {
    try {
      emit(state.copyWith(distance: const AsyncValue.loading()));

      final result = await _repository.hazalert(event.image);
      emit(state.copyWith(distance: AsyncValue.data(result)));
    } catch (e) {
      emit(state.copyWith(distance: AsyncValue.error(e.toString())));
    }
  }
}
