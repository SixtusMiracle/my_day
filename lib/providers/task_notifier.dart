import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_day/models/task.dart';
import 'package:my_day/services/task_service.dart';

List<Task> tasks = [];

final futureTaskNotifierProvider = FutureProvider((ref) async {
  final TaskService _taskService = TaskService();
  final tasks = await _taskService.getTasksFromDatabase();
  return TaskNotifier(tasks);
});

final taskNotifierProvider =
    StateNotifierProvider((ref) => TaskNotifier(tasks));

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskService _taskService = TaskService();

  TaskNotifier(tasks) : super(tasks);

  addTask(Task newTask) {
    state = [
      newTask,
      ...state,
    ];
  }

  removeTask(int id) {
    final taskIndexToRemove = state.indexWhere((task) => task.id == id);
    state = state
        .where((Task task) => state.indexOf(task) != taskIndexToRemove)
        .toList();
  }

  refresh() async {
    state = [];
    state = await _taskService.getTasksFromDatabase();
  }
}
