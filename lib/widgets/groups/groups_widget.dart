import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo/widgets/groups/groups_widget_model.dart';

import '../app/routes.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({super.key});

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final model = GroupsWidgetModel() ;
  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelProvider(model: model,
    child: const _GroupWidgetBody());
  }
}

class _GroupWidgetBody extends StatelessWidget {
  const _GroupWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "ToDo List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: const _GroupListWidget(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => GroupsWidgetModelProvider.of(context).model.showForm(context),
            child: const Icon(Icons.add),
          ),
        ));
  }
}


class _GroupListWidget extends StatelessWidget {
  const _GroupListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final groupsCount = GroupsWidgetModelProvider.of(context).model.groups.length??0;
    return ListView.separated(
        itemBuilder: (context, index) {
          return _GroupListRowWidget(indexInList: index);
        },
        separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: Colors.orange,
            ),
        itemCount: groupsCount);
  }
}

class _GroupListRowWidget extends StatelessWidget {
  int indexInList;

  _GroupListRowWidget({required this.indexInList, super.key});

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetModelProvider.of(context).model;
    final group = model.groups[indexInList];
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {model.deleteGroup(indexInList);},
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: const Color(0xFF0392CF),
          foregroundColor: Colors.white,
          icon: Icons.save,
          label: 'Rename',
        ),
      ]),
      child: ListTile(
        title: Text(group.name),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
