class Task {
  final int id;
  final String icon, title, description;
  final DateTime schedule;
  final bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.schedule,
    required this.isDone,
  });

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        icon: json["icon"],
        schedule: DateTime.fromMillisecondsSinceEpoch(json["schedule"]),
        isDone: json["isDone"] == 0 ? false : true,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "icon": icon,
        "schedule": schedule,
        "isDone": isDone,
      };

  @override
  String toString() {
    return 'Task{id: $id, title: $title, description: $description, icon: $icon, schedule: $schedule, isDone: $isDone}';
  }
}
