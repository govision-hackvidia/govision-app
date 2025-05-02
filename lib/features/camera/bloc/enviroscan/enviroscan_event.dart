part of 'enviroscan_bloc.dart';

@freezed
sealed class EnviroscanEvent with _$EnviroscanEvent {
  const factory EnviroscanEvent.sendScan(String text, File image) = _SendScan;
}
