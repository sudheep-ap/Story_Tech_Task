import 'package:flutter/material.dart';
import '../../data/core/constants.dart';
import '../../data/db/functions/db_functions.dart';
import '../../presentation/widgets/add_or_edit_todo.dart';

abstract class ToDo {
  showAddTodoSheet(context) {}
  showEditTodoSheet(context, dataIndex, Map data) {}
  addOrEditDoOperation(List custToDoList) {}
  clearToDoList();
}

class ToDoMethods implements ToDo {
  @override
  showAddTodoSheet(context) {
    showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) => Container(
              decoration: BoxDecoration(
                  color: AppColors()
                      .klightGreyColor, //AppColors().kButtonYellowColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.5,
              child: const AddOrEditTaskWidget(isEdit: false),
            ));
  }

  @override
  showEditTodoSheet(context, dataIndex, Map data) {
    showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) => ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors().kBgTealColor,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                child: AddOrEditTaskWidget(
                  isEdit: true,
                  itemIndex: dataIndex,
                  toDodata: data,
                ),
              ),
            ));
  }

  @override
  addOrEditDoOperation(List custToDoList) {
    clearTodoList();
    addToList(custToDoList);
  }

  @override
  clearToDoList() {
    clearTodoList();
  }
}
