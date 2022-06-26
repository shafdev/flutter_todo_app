import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_proj_1/todo_bloc.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  final addController = TextEditingController();
  String? task;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if(state is TodoAddState){
          print('in block listener');
          Navigator.pop(context);
        }

      },
      child: Scaffold(
        body: Container(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  child: TextField(
                    controller: addController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Add Task',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      task = value;
                      print(task);
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {

                      print('test :${addController.text}');
                      context.read<TodoBloc>().add(TodoAddEvent(
                          text: addController.text, dateTime: DateTime.now()));

                    },
                    child: Text('Add Task')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
