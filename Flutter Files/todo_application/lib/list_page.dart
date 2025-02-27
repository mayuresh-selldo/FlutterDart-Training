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
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        constraints: BoxConstraints(minWidth: double.infinity),
                        context: context,
                        builder: (context) {
                          var elementAt = _todos.elementAt(index);
                          return Column(
                            children: [
                              Text("Title : ${elementAt.title}"),
                              Text("Description : ${elementAt.description}"),
                              Text(
                                  "Status : ${elementAt.completed ? "Completed" : "Not yet Completed"}"),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
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
                            ? Text('$formattedDate ${todo.time ?? ""}')
                            : null,
                        trailing: SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Confirm Deletion"),
                                        content: Text(
                                            "Are you sure you want to delete this task?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancel"),
                                          ),
                                          FilledButton(
                                            onPressed: () {
                                              setState(() {
                                                _todos.removeAt(index);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            style: FilledButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
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
        label: Text("Add New List"),
        tooltip: "Add a ToDo",
        icon: const Icon(Icons.add),
        backgroundColor: Color(0xFF00008B),
        foregroundColor: Colors.white,
      ),
    );
  }
}
