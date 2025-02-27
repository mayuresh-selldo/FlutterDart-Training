import 'package:flutter/material.dart';
import 'add_list.dart';
import 'models/todo_model.dart';
import 'package:intl/intl.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Todo> _todos = [];
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _editTodo(int index) {
    if (titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a title')),
      );
      return;
    }

    setState(() {
      _todos[index] = Todo(
        title: titleController.text,
        description: descriptionController.text,
        date: selectedDate,
        time: selectedTime != null
            ? '${selectedTime!.hour}:${selectedTime!.minute}'
            : null,
        completed: _todos[index].completed,
      );
    });

    titleController.clear();
    descriptionController.clear();
    selectedDate = null;
    selectedTime = null;
  }

  void _showEditTodoBottomSheet(int index) {
    titleController.text = _todos[index].title;
    descriptionController.text = _todos[index].description;
    selectedDate = _todos[index].date;
    selectedTime = _todos[index].time != null
        ? TimeOfDay(
            hour: int.parse(_todos[index].time!.split(':')[0]),
            minute: int.parse(_todos[index].time!.split(':')[1]),
          )
        : null;

    showModalBottomSheet(
      constraints: const BoxConstraints(minWidth: double.infinity),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Todo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null) {
                            setState(() {
                              selectedDate = picked;
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_today),
                        label: Text(
                          selectedDate != null
                              ? DateFormat('MMM dd, yyyy').format(selectedDate!)
                              : 'Select Date',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: selectedTime ?? TimeOfDay.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              selectedTime = picked;
                            });
                          }
                        },
                        icon: const Icon(Icons.access_time),
                        label: Text(
                          selectedTime != null
                              ? selectedTime!.format(context)
                              : 'Select Time',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      _editTodo(index);
                      Navigator.pop(context);
                    },
                    child: const Text('Update Todo'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

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
                        isScrollControlled: false,
                        context: context,
                        builder: (context) {
                          var elementAt = _todos.elementAt(index);
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: 400,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Title",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    ),
                                    Text(
                                      elementAt.title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    ),
                                    SingleChildScrollView(
                                      child: Text(
                                        elementAt.description,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[700]),
                                        maxLines: null,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      decoration: BoxDecoration(
                                        color: elementAt.completed
                                            ? Colors.green[100]
                                            : Colors.red[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        elementAt.completed
                                            ? "Completed"
                                            : "Not yet Completed",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: elementAt.completed
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    if (elementAt.date != null)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Date",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueAccent),
                                          ),
                                          Text(
                                            DateFormat('MMM dd, yyyy')
                                                .format(elementAt.date!),
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    if (elementAt.time != null)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueAccent),
                                          ),
                                          Text(
                                            elementAt.time!,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: FilledButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: FilledButton.styleFrom(
                                          backgroundColor: Colors.blueAccent,
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Text('Close'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                  _showEditTodoBottomSheet(index);
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
