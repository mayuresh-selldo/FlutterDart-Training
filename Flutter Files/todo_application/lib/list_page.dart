//list.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_list.dart';
import 'models/todo_model.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo List"),
        centerTitle: true,
      ),
      body: _todos.isEmpty
          ? const Center(
              child: Text(
                'No todos yet! Add one by tapping the + button.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                final formattedDate = todo.date != null
                    ? DateFormat('MMM dd, yyyy').format(todo.date!)
                    : '';

                return Dismissible(
                  key: Key(todo.title + index.toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      _todos.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${todo.title} removed')),
                    );
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                        leading: Checkbox(
                          value: todo.completed,
                          onChanged: (bool? value) {
                            setState(() {
                              todo.completed = value ?? false;
                            });
                          },
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.completed
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        subtitle: todo.date != null || todo.time != null
                            ? Text('${formattedDate} ${todo.time ?? ""}')
                            : null,
                        trailing: SizedBox(
                          width: 100, // Give it a constrained width
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // Important: make the row take minimum space
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _todos.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close),
                                iconSize: 20,
                                padding: EdgeInsets.zero,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios),
                                iconSize: 20, // Make icons smaller
                                padding: EdgeInsets.zero, // Remove padding
                              ),
                            ],
                          ),
                        )),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddList(),
            ),
          );

          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              _todos.add(Todo(
                title: result['title'],
                description: result['description'],
                date: result['date'],
                time: result['time'],
                completed: false,
              ));
            });
          }
        },
        tooltip: "Add a ToDo",
        child: const Icon(Icons.add),
      ),
    );
  }
}
