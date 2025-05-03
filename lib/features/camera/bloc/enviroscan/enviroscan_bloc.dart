import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:govision/core/bloc/async_value.dart';
import 'package:govision/data/data.dart';

part 'enviroscan_bloc.freezed.dart';
part 'enviroscan_event.dart';
part 'enviroscan_state.dart';

class EnviroscanBloc extends Bloc<EnviroscanEvent, EnviroscanState> {
  EnviroscanBloc({required EnviroscanRepository repository})
    : _repository = repository,
      super(const EnviroscanState()) {
    on<_SendScan>(_onSendScan);
  }

  final EnviroscanRepository _repository;

  Future<void> _onSendScan(
    _SendScan event,
    Emitter<EnviroscanState> emit,
  ) async {
    try {
      emit(state.copyWith(text: const AsyncValue.loading()));

      final result = await _repository.sendScan(event.text, event.image);
      emit(state.copyWith(text: AsyncValue.data(result)));
    } catch (e) {
      emit(state.copyWith(text: AsyncValue.error(e.toString())));
    }
  }
}
