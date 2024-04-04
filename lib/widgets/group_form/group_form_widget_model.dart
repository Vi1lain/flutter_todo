import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/domain/entity/group.dart';
import 'package:hive/hive.dart';

class GroupFormWidgetModel {
  var groupName = "";

  void saveGroup(BuildContext context) async {
    if (groupName.isEmpty) return;
    if(!Hive.isAdapterRegistered(1)) Hive.registerAdapter(GroupAdapter());
    final box = await Hive.openBox<Group>('groupsBox');
    final group = Group(name: groupName);
     await box.add(group);
     Navigator.of(context).pop();
  }
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
