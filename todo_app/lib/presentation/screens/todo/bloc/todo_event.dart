// ignore_for_file: prefer_typing_uninitialized_variables

part of 'todo_bloc.dart';

abstract class ToDoEvent {}

class AddListEvent extends ToDoEvent {
  final toDoItem;
  AddListEvent({this.toDoItem});
}

class EditListEvent extends ToDoEvent {}
