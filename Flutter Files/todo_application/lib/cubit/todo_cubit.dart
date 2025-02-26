import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/models/todo_model.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  TodoCubit() : super([]);
}
