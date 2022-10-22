class NestedClass {
  NestedClass({
    required this.name,
    required this.surname,
    required this.age,
    required this.children,
  });

  final String name;
  final String surname;
  final int age;
  List<NestedClass> children = [];

  addChild(NestedClass child) => children.add(child);

  NestedClass copyWith({
    String? name,
    String? surname,
    int? age,
    List<NestedClass>? children,
  }) =>
      NestedClass(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        age: age ?? this.age,
        children: children ?? this.children,
      );

  factory NestedClass.initial() => NestedClass(
      name: 'Soy ağacı', surname: 'Yaş dağılımı', age: 500, children: []);
}
