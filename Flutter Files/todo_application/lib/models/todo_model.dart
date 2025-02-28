class Todo {
  final int? id;
  final String title;
  final String description;
  final DateTime? date;
  final String? time;
  bool completed;

  Todo({
    this.id,
    required this.title,
    this.description = '',
    this.date,
    this.time,
    this.completed = false,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'] ?? '',
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      time: map['time'],
      completed: map['status'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date?.toIso8601String(),
      'time': time,
      'status': completed ? 1 : 0,
    };
  }
}
