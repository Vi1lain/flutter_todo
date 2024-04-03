import 'package:flutter/material.dart';
import 'group_form_widget_model.dart';


class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({super.key});

  @override
  State<GroupFormWidget> createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  final _model = GroupFormWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupFormWidgetModelProvider(model: _model,
    child:   _GroupFormWidgetBody());
  }
}



class _GroupFormWidgetBody extends StatelessWidget {

  const _GroupFormWidgetBody({super.key, });

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
      onPressed: ()=>GroupFormWidgetModelProvider.of(context).model.saveGroup(context),
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
    final model = GroupFormWidgetModelProvider.of(context).model;
    return  TextField(autofocus: true,
      decoration: InputDecoration(hintText: "Имя группы",
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder()),
      onChanged: (text)=>model.groupName=text,
      onEditingComplete: ()=>model.saveGroup(context),
    );
  }
}
