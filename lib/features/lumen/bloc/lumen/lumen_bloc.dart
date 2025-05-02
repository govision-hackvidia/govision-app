import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:govision/core/bloc/async_value.dart';
import 'package:govision/data/data.dart';

part 'lumen_bloc.freezed.dart';
part 'lumen_event.dart';
part 'lumen_state.dart';

class LumenBloc extends Bloc<LumenEvent, LumenState> {
  LumenBloc({
    required LumenRepository lumenRepository,
  }) : _repository = lumenRepository,
       super(const LumenState()) {
    on<_SendText>(_onSendText);
  }

  late final LumenRepository _repository;

  Future<void> _onSendText(
    _SendText event,
    Emitter<LumenState> emit,
  ) async {
    try {
      emit(state.copyWith(text: const AsyncValue.loading()));

      final text = await _repository.sendText(event.text);

      emit(state.copyWith(text: AsyncValue.data(text)));
    } catch (e) {
      emit(state.copyWith(text: AsyncValue.error(e.toString())));
    }
  }
}
