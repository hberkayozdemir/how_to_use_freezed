// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nested_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NestedClass {
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  List<NestedClass> get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NestedClassCopyWith<NestedClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedClassCopyWith<$Res> {
  factory $NestedClassCopyWith(
          NestedClass value, $Res Function(NestedClass) then) =
      _$NestedClassCopyWithImpl<$Res>;
  $Res call({String name, String surname, int age, List<NestedClass> children});
}

/// @nodoc
class _$NestedClassCopyWithImpl<$Res> implements $NestedClassCopyWith<$Res> {
  _$NestedClassCopyWithImpl(this._value, this._then);

  final NestedClass _value;
  // ignore: unused_field
  final $Res Function(NestedClass) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? age = freezed,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<NestedClass>,
    ));
  }
}

/// @nodoc
abstract class _$$_NestedClassCopyWith<$Res>
    implements $NestedClassCopyWith<$Res> {
  factory _$$_NestedClassCopyWith(
          _$_NestedClass value, $Res Function(_$_NestedClass) then) =
      __$$_NestedClassCopyWithImpl<$Res>;
  @override
  $Res call({String name, String surname, int age, List<NestedClass> children});
}

/// @nodoc
class __$$_NestedClassCopyWithImpl<$Res> extends _$NestedClassCopyWithImpl<$Res>
    implements _$$_NestedClassCopyWith<$Res> {
  __$$_NestedClassCopyWithImpl(
      _$_NestedClass _value, $Res Function(_$_NestedClass) _then)
      : super(_value, (v) => _then(v as _$_NestedClass));

  @override
  _$_NestedClass get _value => super._value as _$_NestedClass;

  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? age = freezed,
    Object? children = freezed,
  }) {
    return _then(_$_NestedClass(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      children: children == freezed
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<NestedClass>,
    ));
  }
}

/// @nodoc

class _$_NestedClass extends _NestedClass {
  const _$_NestedClass(
      {required this.name,
      required this.surname,
      required this.age,
      required final List<NestedClass> children})
      : _children = children,
        super._();

  @override
  final String name;
  @override
  final String surname;
  @override
  final int age;
  final List<NestedClass> _children;
  @override
  List<NestedClass> get children {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'NestedClass(name: $name, surname: $surname, age: $age, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NestedClass &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.surname, surname) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(surname),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  _$$_NestedClassCopyWith<_$_NestedClass> get copyWith =>
      __$$_NestedClassCopyWithImpl<_$_NestedClass>(this, _$identity);
}

abstract class _NestedClass extends NestedClass {
  const factory _NestedClass(
      {required final String name,
      required final String surname,
      required final int age,
      required final List<NestedClass> children}) = _$_NestedClass;
  const _NestedClass._() : super._();

  @override
  String get name;
  @override
  String get surname;
  @override
  int get age;
  @override
  List<NestedClass> get children;
  @override
  @JsonKey(ignore: true)
  _$$_NestedClassCopyWith<_$_NestedClass> get copyWith =>
      throw _privateConstructorUsedError;
}
