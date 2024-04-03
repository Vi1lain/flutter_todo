import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../app/routes.dart';

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({super.key});

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.GroupFormRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "ToDo List",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: const _GroupListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context),
        child: const Icon(Icons.add),
      ),
    ));
  }
}

class _GroupListWidget extends StatefulWidget {
  const _GroupListWidget({super.key});

  @override
  State<_GroupListWidget> createState() => _GroupListWidgetState();
}

class _GroupListWidgetState extends State<_GroupListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return _GroupListRowWidget(indexInList: index);
        },
        separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: Colors.orange,
            ),
        itemCount: 100);
  }
}

class _GroupListRowWidget extends StatelessWidget {
  int indexInList;

  _GroupListRowWidget({required this.indexInList, super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {},
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
        title: Text("text =$indexInList"),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
