

import 'package:flutter/cupertino.dart';

class GroupsWidgetModel{}

class GroupsWidgetModelProvider extends InheritedWidget {
  final GroupsWidgetModel model;
  const GroupsWidgetModelProvider({
    required  this.model,
    super.key,
    required Widget child,
  }) : super(child: child);

  static GroupsWidgetModelProvider of(BuildContext context) {
    final GroupsWidgetModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<GroupsWidgetModelProvider>();
    assert(result != null, 'No GroupsWidgetModelProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(GroupsWidgetModelProvider old) {
    return true;
  }
}
