part of 'hazalert_bloc.dart';

@freezed
sealed class HazalertState with _$HazalertState {
  const factory HazalertState({
    @Default(AsyncValue<double>.initial()) AsyncValue<double> distance,
  }) = _HazalertState;
}
