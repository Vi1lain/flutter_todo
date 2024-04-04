import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/app/routes.dart';
import 'package:flutter_todo/widgets/group_form/group_form_widget.dart';

import '../groups/groups_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
        scaffoldBackgroundColor: Colors.amberAccent,
        useMaterial3: true,
      ),
      initialRoute: Routes.GroupsRoute,
      routes: {
        Routes.GroupsRoute: (context) => GroupsWidget(),
        Routes.GroupFormRoute: (context) => GroupFormWidget(),
      },
    );
  }
}
