import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'line.freezed.dart';

@freezed
class Line with _$Line {
  factory Line({
    @Default(<Offset>[]) List<Offset> offsetList,
  }) = _Line;
}
