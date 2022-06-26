import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_proj_1/todo_add_task.dart';
import 'package:todo_proj_1/todo_bloc.dart';
import 'package:todo_proj_1/todo_bloc.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'A',
  ];
  // final List<String> entries = <String>[];

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is TodoAddState) {
          if (state.text.isNotEmpty) {
            setState(() {
              entries.add(state.text);
            });
          }
        }
        if (state is TodoDelState) {
          // print('del state');
          // print(state);
          setState(() {
            entries.removeAt(state.index);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          //onpressing move to a new screen and returns a task
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddTaskPage();
            }));
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: SafeArea(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: entries.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return TodoCard(
                  ///delete button
                  onPress: () {
                    context.read<TodoBloc>().add(
                        TodoDelEvent(index: index, dateTime: DateTime.now()));
                  },
                  entries: entries,
                  index: index,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  // const TodoCard({Key? key}) : super(key: key);
  TodoCard({this.entries, this.index, this.onPress});

  final VoidCallback? onPress;
  final entries;
  final index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            // height: 50,
            margin: const EdgeInsets.all(10),
            // color: Colors.amber[colorCodes[index]],
            color: const Color.fromARGB(255, 31, 115, 121),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(child: Text('Task : ${entries[index]}')),
            ),
          ),
        ),
        GestureDetector(
            onTap: onPress,
            child: Icon(
              Icons.close,
              size: 40,
            )),
      ],
    );
  }
}
