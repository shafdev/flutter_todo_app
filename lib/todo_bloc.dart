import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {

    on<TodoAddEvent>((event, emit) {
      print('In Block class${event.text}');
      emit (TodoAddState(text:event.text, dateTime: event.dateTime));

    });

    on<TodoDelEvent>((event,emit){
     print('in bloc del event');

     emit(TodoDelState(index: event.index, dateTime:event.dateTime));
    });

  }
}
