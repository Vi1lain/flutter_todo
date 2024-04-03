import 'package:flutter/cupertino.dart';

class GroupFormWidgetModel {
  var groupName = "";
  void saveGroup(BuildContext context) {print(groupName);}
}

class GroupFormWidgetModelProvider extends InheritedWidget {
  final GroupFormWidgetModel model;

  const GroupFormWidgetModelProvider({
    required this.model,
    super.key,
    required Widget child,
  }) : super(child: child);

  static GroupFormWidgetModelProvider of(BuildContext context) {
    final GroupFormWidgetModelProvider? result = context
        .dependOnInheritedWidgetOfExactType<GroupFormWidgetModelProvider>();
    assert(result != null, 'No GroupsWidgetModelProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(GroupFormWidgetModelProvider old) {
    return true;
  }
}
