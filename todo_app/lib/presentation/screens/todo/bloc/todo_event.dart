// ignore_for_file: prefer_typing_uninitialized_variables

part of 'todo_bloc.dart';

abstract class ToDoEvent {}

class AddListEvent extends ToDoEvent {
  final toDoItem;
  AddListEvent({required this.toDoItem});
}

class EditListEvent extends ToDoEvent {
  final toDoItem;
  final itemIndex;
  final title;
  final date;
  final time;

  EditListEvent({
    this.toDoItem,
    required this.itemIndex,
    required this.title,
    required this.date,
    required this.time,
  });
}
