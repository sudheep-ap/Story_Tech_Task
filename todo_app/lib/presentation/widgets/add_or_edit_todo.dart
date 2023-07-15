// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/screens/todo/bloc/todo_bloc.dart';

class AddOrEditTaskWidget extends StatelessWidget {
  final isEdit;
  const AddOrEditTaskWidget({super.key, this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            TextFormField(),
            Row(
              children: [
                //date
                //time
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ToDoBloc>().add(AddListEvent());
                },
                child: Text('Submit'))
          ],
        ),
        //
      ],
    );
  }
}
