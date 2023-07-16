import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/core/common_widgets.dart';
import 'package:todo_app/data/core/constants.dart';
import 'package:todo_app/presentation/screens/todo/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/widgets/todo_tile.dart';
import '../../../domian/models/todo_model.dart';
import '../../widgets/home_drawer.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'To-Do',
          style: TextStyle(
              color: AppColors().kTextWhiteColor,
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors().kDarkTealColor,
      ),
      drawer: const HomePageDrawer(),
      backgroundColor: AppColors().kBgTealColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                kSizedBox20,
                BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
                  if (state.toDoList.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Center(
                          child: Text(
                        'No pending tasks',
                        style: TextStyle(
                            fontSize: 18, color: AppColors().kTextGreyColor),
                      )),
                    );
                  } else {
                    return SizedBox(
                      //height: MediaQuery.of(context).size.height / 1.6,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ToDoTile(
                              toDoItemIndex: index,
                              toDoItem: state.toDoList[index]),
                          separatorBuilder: (context, index) => Divider(
                                thickness: 1,
                                color: AppColors().kBlueGreyColor,
                              ),
                          itemCount: state.toDoList.length),
                    );
                  }
                }),
                kSizedBox40,
                kSizedBox20
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors().kMainWhiteColor,
          heroTag: 'FlButton',
          child: Center(
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors().kIconTealColor,
              size: 32,
            ),
          ),
          onPressed: () {
            ToDoMethods().showAddTodoSheet(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
