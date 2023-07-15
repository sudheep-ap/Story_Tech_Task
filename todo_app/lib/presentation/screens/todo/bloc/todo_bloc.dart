import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<AddListEvent>((event, emit) {
      // TODO: implement event handler
      emit(ToDoState(toDoList: [{}]));
    });
    on<EditListEvent>((event, emit) {
      // TODO: implement event handler
      emit(ToDoState(toDoList: [{}]));
    });
  }
}

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(InitialState()) {
//     on<Increment>(
//         (event, emit) => {emit(CounterState(count: state.count + 1))});

//     on<Decrement>(
//         (event, emit) => {emit(CounterState(count: state.count - 1))});
//   }
// }
