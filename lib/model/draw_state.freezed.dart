// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draw_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrawState {
  List<Line> get lineList => throw _privateConstructorUsedError;
  List<Line> get undoList => throw _privateConstructorUsedError;
  bool get isDrag => throw _privateConstructorUsedError;
  int get predictedNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawStateCopyWith<DrawState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawStateCopyWith<$Res> {
  factory $DrawStateCopyWith(DrawState value, $Res Function(DrawState) then) =
      _$DrawStateCopyWithImpl<$Res, DrawState>;
  @useResult
  $Res call(
      {List<Line> lineList,
      List<Line> undoList,
      bool isDrag,
      int predictedNumber});
}

/// @nodoc
class _$DrawStateCopyWithImpl<$Res, $Val extends DrawState>
    implements $DrawStateCopyWith<$Res> {
  _$DrawStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineList = null,
    Object? undoList = null,
    Object? isDrag = null,
    Object? predictedNumber = null,
  }) {
    return _then(_value.copyWith(
      lineList: null == lineList
          ? _value.lineList
          : lineList // ignore: cast_nullable_to_non_nullable
              as List<Line>,
      undoList: null == undoList
          ? _value.undoList
          : undoList // ignore: cast_nullable_to_non_nullable
              as List<Line>,
      isDrag: null == isDrag
          ? _value.isDrag
          : isDrag // ignore: cast_nullable_to_non_nullable
              as bool,
      predictedNumber: null == predictedNumber
          ? _value.predictedNumber
          : predictedNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DrawStateCopyWith<$Res> implements $DrawStateCopyWith<$Res> {
  factory _$$_DrawStateCopyWith(
          _$_DrawState value, $Res Function(_$_DrawState) then) =
      __$$_DrawStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Line> lineList,
      List<Line> undoList,
      bool isDrag,
      int predictedNumber});
}

/// @nodoc
class __$$_DrawStateCopyWithImpl<$Res>
    extends _$DrawStateCopyWithImpl<$Res, _$_DrawState>
    implements _$$_DrawStateCopyWith<$Res> {
  __$$_DrawStateCopyWithImpl(
      _$_DrawState _value, $Res Function(_$_DrawState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineList = null,
    Object? undoList = null,
    Object? isDrag = null,
    Object? predictedNumber = null,
  }) {
    return _then(_$_DrawState(
      lineList: null == lineList
          ? _value._lineList
          : lineList // ignore: cast_nullable_to_non_nullable
              as List<Line>,
      undoList: null == undoList
          ? _value._undoList
          : undoList // ignore: cast_nullable_to_non_nullable
              as List<Line>,
      isDrag: null == isDrag
          ? _value.isDrag
          : isDrag // ignore: cast_nullable_to_non_nullable
              as bool,
      predictedNumber: null == predictedNumber
          ? _value.predictedNumber
          : predictedNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DrawState implements _DrawState {
  _$_DrawState(
      {final List<Line> lineList = const <Line>[],
      final List<Line> undoList = const <Line>[],
      this.isDrag = false,
      this.predictedNumber = 0})
      : _lineList = lineList,
        _undoList = undoList;

  final List<Line> _lineList;
  @override
  @JsonKey()
  List<Line> get lineList {
    if (_lineList is EqualUnmodifiableListView) return _lineList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lineList);
  }

  final List<Line> _undoList;
  @override
  @JsonKey()
  List<Line> get undoList {
    if (_undoList is EqualUnmodifiableListView) return _undoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_undoList);
  }

  @override
  @JsonKey()
  final bool isDrag;
  @override
  @JsonKey()
  final int predictedNumber;

  @override
  String toString() {
    return 'DrawState(lineList: $lineList, undoList: $undoList, isDrag: $isDrag, predictedNumber: $predictedNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrawState &&
            const DeepCollectionEquality().equals(other._lineList, _lineList) &&
            const DeepCollectionEquality().equals(other._undoList, _undoList) &&
            (identical(other.isDrag, isDrag) || other.isDrag == isDrag) &&
            (identical(other.predictedNumber, predictedNumber) ||
                other.predictedNumber == predictedNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lineList),
      const DeepCollectionEquality().hash(_undoList),
      isDrag,
      predictedNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DrawStateCopyWith<_$_DrawState> get copyWith =>
      __$$_DrawStateCopyWithImpl<_$_DrawState>(this, _$identity);
}

abstract class _DrawState implements DrawState {
  factory _DrawState(
      {final List<Line> lineList,
      final List<Line> undoList,
      final bool isDrag,
      final int predictedNumber}) = _$_DrawState;

  @override
  List<Line> get lineList;
  @override
  List<Line> get undoList;
  @override
  bool get isDrag;
  @override
  int get predictedNumber;
  @override
  @JsonKey(ignore: true)
  _$$_DrawStateCopyWith<_$_DrawState> get copyWith =>
      throw _privateConstructorUsedError;
}
