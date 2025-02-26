// todo_model.dart
class Todo {
  final String title;
  final String description;
  final DateTime? date;
  final String? time;
  bool completed;

  Todo({
    required this.title,
    this.description = '',
    this.date,
    this.time,
    this.completed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date?.millisecondsSinceEpoch,
      'time': time,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      description: map['description'] ?? '',
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      time: map['time'],
      completed: map['completed'] ?? false,
    );
  }
}
