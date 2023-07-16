// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app/data/core/constants.dart';
import 'package:todo_app/domian/models/todo_model.dart';

class ToDoTile extends StatelessWidget {
  final toDoItemIndex;
  final toDoItem;
  const ToDoTile(
      {super.key, required this.toDoItemIndex, required this.toDoItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        minLeadingWidth: 2,
        tileColor: AppColors().kListTileColor,
        leading: Icon(
          Icons.donut_large_rounded,
          color: AppColors().kIconWhiteColor,
          size: 35,
        ),
        title: Text(
          toDoItem['title'].toString(),
          style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppColors().kTextWhiteColor),
        ),
        subtitle: Row(
          children: [
            Text(
              toDoItem['date'].toString(),
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColors().kTextWhiteColor),
            ),
            const SizedBox(width: 15),
            Text(
              toDoItem['time'].toString(),
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColors().kTextWhiteColor),
            ),
          ],
        ),
        trailing: CircleAvatar(
          backgroundColor: AppColors().kButtonTealColor,
          child: IconButton(
              onPressed: () => ToDoMethods()
                  .showEditTodoSheet(context, toDoItemIndex, toDoItem as Map),
              icon: const Icon(
                Icons.edit_note_sharp,
              )),
        ));
  }
}
