class Task {
  final String icon, title, description;
  final DateTime schedule;
  final bool done;
  final int id;

  Task({
    this.done = false,
    required this.title,
    required this.description,
    required this.icon,
    required this.schedule,
    required this.id,
  });
}
