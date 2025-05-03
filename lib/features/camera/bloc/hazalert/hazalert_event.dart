part of 'hazalert_bloc.dart';

@freezed
sealed class HazalertEvent with _$HazalertEvent {
  const factory HazalertEvent.hazalert(XFile image) = _Hazalert;
}
