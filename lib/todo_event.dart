part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {

  const TodoEvent();

}

class TodoAddEvent extends TodoEvent{
  final String text;
  final DateTime dateTime;
  const TodoAddEvent({required this.text, required this.dateTime});

  @override
  List<Object?> get props => [dateTime];

}

class TodoDelEvent extends TodoEvent{
  final int index;
  final DateTime dateTime;
  const TodoDelEvent({required this.index, required this.dateTime});

  @override
  List<Object?> get props => [dateTime];

}
