part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoAddState extends TodoState {
  final String text;
  final DateTime dateTime;

  const TodoAddState({required this.text, required this.dateTime});

  @override
  List<Object?> get props => [dateTime];

}

class TodoDelState extends TodoState {
  final int index;
  final DateTime dateTime;

  const TodoDelState({required this.index, required this.dateTime});

  @override
  List<Object?> get props => [dateTime];

}