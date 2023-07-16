import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domian/todo.dart';
import '../../../../main.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<AddListEvent>((event, emit) {
      final todoItem = event.toDoItem;
      custTodoList.add(todoItem);
      ToDoMethods().addOrEditDoOperation(custTodoList);
      emit(ToDoState(toDoList: custTodoList));
    });
    on<EditListEvent>((event, emit) {
      custTodoList[event.itemIndex] = {
        'title': event.title,
        'date': event.date,
        'time': event.time
      };
      ToDoMethods().addOrEditDoOperation(custTodoList);
      emit(ToDoState(toDoList: custTodoList));
    });
    on<ClearAllListEvent>((event, emit) {
      custTodoList.clear();
      ToDoMethods().addOrEditDoOperation(custTodoList);
      emit(ToDoState(toDoList: custTodoList));
    });
  }
}
