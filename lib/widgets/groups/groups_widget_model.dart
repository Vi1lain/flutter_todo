import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entity/group.dart';
import '../app/routes.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  GroupsWidgetModel() {
    _setup();
  }
void deleteGroup (int indexGroup) async{
  if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(GroupAdapter());
  final box = await Hive.openBox<Group>('groupsBox');
await box.deleteAt(indexGroup);
}
  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.GroupFormRoute);
  }

  void _readGroupsFromHive(Box<Group> box) {
    _groups = box.values.toList();
    notifyListeners();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(GroupAdapter());
    final box = await Hive.openBox<Group>('groupsBox');
    _readGroupsFromHive(box);
    box.listenable().addListener(() => _readGroupsFromHive(box));
  }
}

class GroupsWidgetModelProvider extends InheritedNotifier {
  final GroupsWidgetModel model;

  const GroupsWidgetModelProvider({
    required this.model,
    super.key,
    required Widget child,
  }) : super(child: child, notifier: model);

  static GroupsWidgetModelProvider of(BuildContext context) {
    final GroupsWidgetModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<GroupsWidgetModelProvider>();
    assert(result != null, 'No GroupsWidgetModelProvider found in context');
    return result!;
  }
}
