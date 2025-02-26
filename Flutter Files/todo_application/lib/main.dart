import 'package:flutter/material.dart';
import 'package:todo_application/list_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: ToDoApplication(),
    ),
  );
}

class ToDoApplication extends StatelessWidget {
  const ToDoApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ListPage();
  }
}
