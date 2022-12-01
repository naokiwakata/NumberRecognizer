// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Line {
  List<Offset> get offsetList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LineCopyWith<Line> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineCopyWith<$Res> {
  factory $LineCopyWith(Line value, $Res Function(Line) then) =
      _$LineCopyWithImpl<$Res, Line>;
  @useResult
  $Res call({List<Offset> offsetList});
}

/// @nodoc
class _$LineCopyWithImpl<$Res, $Val extends Line>
    implements $LineCopyWith<$Res> {
  _$LineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offsetList = null,
  }) {
    return _then(_value.copyWith(
      offsetList: null == offsetList
          ? _value.offsetList
          : offsetList // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LineCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$$_LineCopyWith(_$_Line value, $Res Function(_$_Line) then) =
      __$$_LineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Offset> offsetList});
}

/// @nodoc
class __$$_LineCopyWithImpl<$Res> extends _$LineCopyWithImpl<$Res, _$_Line>
    implements _$$_LineCopyWith<$Res> {
  __$$_LineCopyWithImpl(_$_Line _value, $Res Function(_$_Line) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offsetList = null,
  }) {
    return _then(_$_Line(
      offsetList: null == offsetList
          ? _value._offsetList
          : offsetList // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
    ));
  }
}

/// @nodoc

class _$_Line implements _Line {
  _$_Line({final List<Offset> offsetList = const <Offset>[]})
      : _offsetList = offsetList;

  final List<Offset> _offsetList;
  @override
  @JsonKey()
  List<Offset> get offsetList {
    if (_offsetList is EqualUnmodifiableListView) return _offsetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offsetList);
  }

  @override
  String toString() {
    return 'Line(offsetList: $offsetList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Line &&
            const DeepCollectionEquality()
                .equals(other._offsetList, _offsetList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_offsetList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LineCopyWith<_$_Line> get copyWith =>
      __$$_LineCopyWithImpl<_$_Line>(this, _$identity);
}

abstract class _Line implements Line {
  factory _Line({final List<Offset> offsetList}) = _$_Line;

  @override
  List<Offset> get offsetList;
  @override
  @JsonKey(ignore: true)
  _$$_LineCopyWith<_$_Line> get copyWith => throw _privateConstructorUsedError;
}
