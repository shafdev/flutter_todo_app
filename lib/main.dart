// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_proj_1/todo_bloc.dart';
import 'home_page.dart';
import 'package:todo_proj_1/large_screen.dart';

void main() {
  runApp(BlocProvider<TodoBloc>(
    create: (context) => TodoBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: DisplayHomePage(),
    );
  }
}

class DisplayHomePage extends StatelessWidget {
  const DisplayHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var window = MediaQuery.of(context).size;
    print(window.width);
    if (window.width < 700.0) {
      return HomePage();
    } else {
      return LargeHomePage();
    }
  }
}
