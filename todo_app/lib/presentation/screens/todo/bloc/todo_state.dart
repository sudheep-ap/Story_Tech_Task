part of 'todo_bloc.dart';

class ToDoState {
  final List toDoList;
  ToDoState({required this.toDoList});
}

class ToDoInitial extends ToDoState {
  ToDoInitial() : super(toDoList: custTodoList);
}
