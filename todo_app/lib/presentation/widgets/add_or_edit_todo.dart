// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/core/common_widgets.dart';
import 'package:todo_app/data/core/constants.dart';
import 'package:todo_app/presentation/screens/todo/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/widgets/textFiled_widget.dart';

class AddOrEditTaskWidget extends StatefulWidget {
  final isEdit;
  final toDodata; //map
  final itemIndex;
  const AddOrEditTaskWidget(
      {super.key, required this.isEdit, this.toDodata, this.itemIndex});

  @override
  State<AddOrEditTaskWidget> createState() => _AddOrEditTaskWidgetState();
}

class _AddOrEditTaskWidgetState extends State<AddOrEditTaskWidget> {
  final taskTitleController = TextEditingController();
  ValueNotifier taskDateNotifier = ValueNotifier('');
  ValueNotifier taskTimeNotifier = ValueNotifier('');
  ValueNotifier showTimeValidMsg = ValueNotifier(false);
  ValueNotifier showDateValidMsg = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isEdit) {
      taskTitleController.text = widget.toDodata["title"];
      taskDateNotifier.value = widget.toDodata["date"];
      taskTimeNotifier.value = widget.toDodata["time"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Hero(
                      tag: 'FlButton',
                      child: Icon(
                        Icons.close,
                        size: 30,
                        color: AppColors().kIconBlackColor,
                      )),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFieldWidget(
                  prefixIcon: Icons.wrap_text_sharp,
                  controller: taskTitleController,
                  hintText: 'Enter title',
                  validatorMessage: 'Can\'t leave this field empty',
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        taskDateNotifier.value = formattedDate;
                        showDateValidMsg.value = false;
                        showDateValidMsg.notifyListeners();
                        taskDateNotifier.notifyListeners();
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            ValueListenableBuilder(
                                valueListenable: taskDateNotifier,
                                builder: (context, date, _) {
                                  return Text(date.toString().isEmpty
                                      ? 'Date'
                                      : date.toString());
                                })
                          ],
                        ),
                        kSizedBox20,
                        ValueListenableBuilder(
                            valueListenable: showDateValidMsg,
                            builder: (context, isValid, _) {
                              return Visibility(
                                visible: widget.isEdit ? false : isValid,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Please choose a date',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (pickedTime != null) {
                          taskTimeNotifier.value = pickedTime.format(context);
                          taskTimeNotifier.notifyListeners();
                          showTimeValidMsg.value = false;
                          showTimeValidMsg.notifyListeners();
                        }
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.access_time_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            ValueListenableBuilder(
                                valueListenable: taskTimeNotifier,
                                builder: (context, time, _) {
                                  return Text(time.toString().isEmpty
                                      ? 'Time'
                                      : time.toString());
                                })
                          ],
                        ),
                        kSizedBox20,
                        ValueListenableBuilder(
                            valueListenable: showTimeValidMsg,
                            builder: (context, isValid, _) {
                              return Visibility(
                                visible: widget.isEdit ? false : isValid,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Please choose a time',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kSizedBox40,
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.21),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (taskDateNotifier.value.toString().isNotEmpty) {
                      if (taskTimeNotifier.value.toString().isNotEmpty) {
                        if (widget.isEdit) {
                          context.read<ToDoBloc>().add(EditListEvent(
                              itemIndex: widget.itemIndex,
                              title: taskTitleController.text.trim(),
                              date: taskDateNotifier.value,
                              time: taskTimeNotifier.value));
                          //FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pop(context);
                        } else {
                          context.read<ToDoBloc>().add(AddListEvent(toDoItem: {
                                'title': taskTitleController.text.trim(),
                                'date': taskDateNotifier.value,
                                'time': taskTimeNotifier.value
                              }));
                          // FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pop(context);
                        }
                      } else {
                        showTimeValidMsg.value = true;
                        showTimeValidMsg.notifyListeners();
                      }
                    } else {
                      showDateValidMsg.value = true;
                      showDateValidMsg.notifyListeners();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors().kButtonTealColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Submit',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
