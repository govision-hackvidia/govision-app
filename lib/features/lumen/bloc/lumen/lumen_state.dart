part of 'lumen_bloc.dart';

@freezed
sealed class LumenState with _$LumenState {
  const factory LumenState({
    @Default(AsyncValue<String>.initial()) AsyncValue<String> text,
  }) = _LumenState;
}
