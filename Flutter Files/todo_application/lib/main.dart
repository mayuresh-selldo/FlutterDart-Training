import 'package:flutter/material.dart';
import 'package:todo_application/todo_list.dart';

void main() {
  runApp(const ToDoApplication());
}

class ToDoApplication extends StatelessWidget {
  const ToDoApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoList();
  }
}
