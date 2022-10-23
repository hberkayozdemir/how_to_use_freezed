import 'package:flutter/material.dart';
import 'package:how_to_use_freezed/data_initialization/load_data.dart';
import 'package:how_to_use_freezed/data_initialization/load_family_tree.dart';
import 'package:how_to_use_freezed/delete.dart';
import 'package:how_to_use_freezed/helper_functions/get_names.dart';
import 'package:how_to_use_freezed/nested_class.dart';

List<List<Widget>> loadUndoList() {
  NestedClass familyTree = loadFamilyTree();

  final deleted1 = delete(object: children1, hierarchy: familyTree);
  final deleted2 = delete(object: children2, hierarchy: deleted1);
  final deleted3 = delete(object: children3, hierarchy: deleted2);
  final deleted4 = delete(object: children4, hierarchy: deleted3);
  final deleted5 = delete(object: children5, hierarchy: deleted4);
  final deleted6 = delete(object: children6, hierarchy: deleted5);

  List<NestedClass> undoList = [
    familyTree,
    deleted1,
    deleted2,
    deleted3,
    deleted4,
    deleted5,
    deleted6,
  ];

  List<List<Widget>> namesList = [];
  if (undoList.isEmpty) {
    undoList.add(familyTree);
  }

  addNamesToList(undoList, namesList);
  return namesList;
}

void addNamesToList(List<NestedClass> undoList, List<List<Widget>> namesList) {
  for (var undo in undoList) {
    List<Widget> newNames = getNames(undo);
    namesList.add(newNames);
  }
}
