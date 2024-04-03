import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/groups/groups_widget_model.dart';


class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({super.key});

  @override
  State<GroupFormWidget> createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  final model = GroupsWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelProvider(model: model,
    child:  _GroupFormWidgetBody());
  }
}



class _GroupFormWidgetBody extends StatelessWidget {
  const _GroupFormWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Add Group",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.done),
    ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: _GroupNameWidget(),
          ),
        ),
      ),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(autofocus: true,
      decoration: InputDecoration(hintText: "Имя группы",
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder()),
    );
  }
}
