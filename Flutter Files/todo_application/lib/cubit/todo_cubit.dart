import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(Todo todo) {
    final currentState = List<Todo>.from(state);
    currentState.add(todo);
    emit(currentState);
  }

  void removeTodo(int index) {
    final currentState = List<Todo>.from(state);
    currentState.removeAt(index);
    emit(currentState);
  }

  void toggleComplete(int index) {
    final currentState = List<Todo>.from(state);
    currentState[index].completed = !currentState[index].completed;
    emit(currentState);
  }
}
