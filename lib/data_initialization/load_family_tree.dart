import 'package:how_to_use_freezed/data_initialization/load_data.dart';
import 'package:how_to_use_freezed/nested_class.dart';

NestedClass loadFamilyTree() {
  familyHierarchy.addChild(greatGrandParents);

  greatGrandParents.addChild(grandParents1);
  greatGrandParents.addChild(grandParents2);

  grandParents1.addChild(parents1);
  grandParents1.addChild(parents2);
  grandParents1.addChild(parents3);

  parents1.addChild(children1);
  parents1.addChild(children2);

  parents2.addChild(children3);
  parents2.addChild(children4);

  parents3.addChild(children5);
  parents3.addChild(children6);

  return familyHierarchy;
}
