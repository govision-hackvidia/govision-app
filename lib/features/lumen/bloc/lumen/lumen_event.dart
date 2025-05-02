part of 'lumen_bloc.dart';

@freezed
sealed class LumenEvent with _$LumenEvent {
  const factory LumenEvent.sendText(String text) = _SendText;
}
