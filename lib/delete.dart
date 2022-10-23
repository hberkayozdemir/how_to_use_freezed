import 'package:how_to_use_freezed/nested_class.dart';

NestedClass delete({
  required NestedClass object,
  required NestedClass hierarchy,
}) {
  // 1. Conditionally copy the hierarchy.
  NestedClass? copiedHierarchy =
      hierarchy.children.contains(object) ? hierarchy : null;
  // 2. Conditionally modifies the children of the hierarchy.
  if (copiedHierarchy != null) {
    return hierarchy.copyWith(children: [
      for (var child in hierarchy.children)
        if (child != object) child,
    ]);
  }
  // 3. returns copied and modified hierarchy.
  return hierarchy.copyWith(
    children: [
      for (var child in hierarchy.children)
        // Recursively call delete on the children of the hierarchy.
        delete(object: object, hierarchy: child),
    ],
  );
}
