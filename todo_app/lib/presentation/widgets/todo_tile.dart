// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final title;
  final date;
  final time;
  final toDoItem;
  const ToDoTile(
      {super.key, this.title, this.date, this.time, required this.toDoItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.arrow_forward_ios_rounded),
      title: Text(title.toString()),
      subtitle: Text(date.toString()),
      trailing: Text(time.toString()),
      onTap: () {},
    );
  }
}
