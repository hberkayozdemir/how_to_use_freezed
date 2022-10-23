import 'package:freezed_annotation/freezed_annotation.dart';

part 'nested_class.freezed.dart';

@freezed
class NestedClass with _$NestedClass {
  const NestedClass._();
  const factory NestedClass({
    required String name,
    required String surname,
    required int age,
    required List<NestedClass> children,
  }) = _NestedClass;

/* 3a */  // add const factory NestedClass.initial()
  factory NestedClass.initial() => const NestedClass(
      name: 'Soy Ağacı', surname: 'Yaş Çizgisi', age: 500, children: []);
}
