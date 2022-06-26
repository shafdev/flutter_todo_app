import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_proj_1/large_screen_todo_add.dart';
import 'package:todo_proj_1/todo_bloc.dart';

class LargeHomePage extends StatefulWidget {
  const LargeHomePage({Key? key}) : super(key: key);

  @override
  State<LargeHomePage> createState() => _LargeHomePageState();
}

class _LargeHomePageState extends State<LargeHomePage> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
  ];

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
          setState(() {
            entries.removeAt(state.index);
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    const TaskHeading(),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10),
                      itemCount: entries.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return TodoCard(
                          ///delete button
                          onPress: () {
                            context.read<TodoBloc>().add(
                                  TodoDelEvent(
                                      index: index, dateTime: DateTime.now()),
                                );
                          },
                          entries: entries,
                          index: index,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: AddTaskPage()),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskHeading extends StatelessWidget {
  const TaskHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: const Card(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'My Task',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      )),
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
            child: const Icon(
              Icons.close,
              size: 40,
            )),
      ],
    );
  }
}
