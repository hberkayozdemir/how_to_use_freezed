import 'package:how_to_use_freezed/data_initialization/load_data.dart';
import 'package:how_to_use_freezed/nested_class.dart';

NestedClass loadFamilyTree() {
  var newParents1 = parents1.copyWith(children: [
    children1,
    children2,
  ]);

  var newParents2 = parents2.copyWith(children: [
    children3,
    children4,
  ]);

  var newParents3 = parents3.copyWith(children: [
    children5,
    children6,
  ]);

  var newGrandParents1 = grandParents1.copyWith(children: [
    newParents1,
    newParents2,
    newParents3,
  ]);

  var newGrandParents2 = grandParents2.copyWith(children: []);

  var newGreatGrandParents = greatGrandParents.copyWith(children: [
    newGrandParents1,
    newGrandParents2,
  ]);

  var newFamilyTree = familyHierarchy.copyWith(children: [
    newGreatGrandParents,
  ]);

  return newFamilyTree;
}
