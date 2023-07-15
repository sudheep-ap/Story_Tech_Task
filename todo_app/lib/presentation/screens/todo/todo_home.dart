import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/core/common_widgets.dart';
import 'package:todo_app/data/core/constants.dart';
import 'package:todo_app/presentation/screens/todo/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/widgets/todo_tile.dart';

import '../../widgets/add_or_edit_todo.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Dahboards'),
              kSizedBox40,
              BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
                if (state.toDoList.isEmpty) {
                  //print('No Pending tasks');
                  return Text('No Pending tasks');
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            ToDoTile(toDoItem: state.toDoList[index]),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.toDoList.length),
                  );
                }
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle_outline_sharp),
          onPressed: () {
            //BOTTOM BAR
            showModalBottomSheet(
                isDismissible: false,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (ctx) => Container(
                      decoration: BoxDecoration(
                          color: AppColors().kButtonYellowColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: AddOrEditTaskWidget(),
                    ));
          }),
    );
  }
}

class ToDoHomep extends StatelessWidget {
  const ToDoHomep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.arrow_back_ios),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "My Todo List",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 50),
                        height: MediaQuery.of(context).size.height / 2.8,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(),
                      ),
                      //bloc builder

                      // GetBuilder<Todocontroller>(
                      //   builder: (controller) => ListView.separated(
                      //       itemBuilder: (context, index) {
                      //         return Obx(() => InkWell(
                      //               onTap: () => Get.to(
                      //                 NewTask(
                      //                   isNewTask: false,
                      //                   index: index,
                      //                   todo: todocontroller
                      //                       .pendingTodo[index],
                      //                 ),
                      //               ),
                      //               child: ListTile(
                      //                   title: Text(todocontroller
                      //                       .pendingTodo[index].title!),
                      //                   subtitle: Text(todocontroller
                      //                       .pendingTodo[index].date
                      //                       .toString()),
                      //                   tileColor: Colors.white,
                      //                   trailing: Checkbox(
                      //                     value: todocontroller
                      //                         .pendingTodo[index].completed,
                      //                     onChanged: (value) {
                      //                       todocontroller
                      //                           .pendingTodo[index]
                      //                           .completed = value!;
                      //                       todocontroller.updateStatus(
                      //                           value, index);
                      //                     },
                      //                   )),
                      //             ));
                      //       },
                      //       separatorBuilder: (context, index) =>
                      //           const Divider(),
                      //       itemCount: todocontroller.pendingTodo.length),
                      // )),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Compleated")),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 0),
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox()),
                      //bloc builder
                      //  GetBuilder<Todocontroller>(
                      //   builder: (controller) => ListView.separated(
                      //       itemBuilder: (context, index) {
                      //         return CheckboxListTile(
                      //           title: Text(todocontroller
                      //               .completedTodo[index].title),
                      //           subtitle: Text(todocontroller
                      //               .completedTodo[index].date
                      //               .toString()),
                      //           tileColor: Colors.white,
                      //           value: todocontroller
                      //               .completedTodo[index].completed,
                      //           onChanged: (value) {
                      //             todocontroller.completedTodo[index]
                      //                 .completed = value!;

                      //             todocontroller.updateStatus(value, index);

                      //             print(value);
                      //           },
                      //         );
                      //       },
                      //       separatorBuilder: (context, index) =>
                      //           const Divider(),
                      //       itemCount: todocontroller.completedTodo.length),
                      // )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {},
          child: const Text(
            'Add New Task',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
