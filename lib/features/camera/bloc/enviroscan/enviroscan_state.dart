part of 'enviroscan_bloc.dart';

@freezed
sealed class EnviroscanState with _$EnviroscanState {
  const factory EnviroscanState({
    @Default(AsyncValue<String>.initial()) AsyncValue<String> text,
  }) = _EnviroscanState;
}
