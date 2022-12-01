import 'package:digit_recognition/entity/line.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_state.freezed.dart';

@freezed
class DrawState with _$DrawState {
  factory DrawState({
    @Default(<Line>[]) List<Line> lineList,
    @Default(<Line>[]) List<Line> undoList,
    @Default(false) bool isDrag,
  }) = _DrawState;
}
