import 'package:flutter/widgets.dart';
import 'package:how_to_use_freezed/nested_class.dart';

List<Widget> getNames(NestedClass updatedHierarchy) {
  List<Widget> namesList = [];
  namesList.add(
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'İsim: ${updatedHierarchy.name}, Soyisim: ${updatedHierarchy.surname}, Yaş: ${updatedHierarchy.age}',
      ),
    ),
  );
  for (var child in updatedHierarchy.children) {
    namesList.addAll(getNames(child));
  }
  return namesList;
}
