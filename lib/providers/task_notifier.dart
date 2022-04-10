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

  updateTaskStatusInState(int id, bool status) async {
    final taskIndexToUpdate = state.indexWhere((task) => task.id == id);
    state[taskIndexToUpdate] = Task(
      id: state[taskIndexToUpdate].id,
      title: state[taskIndexToUpdate].title,
      description: state[taskIndexToUpdate].description,
      icon: state[taskIndexToUpdate].icon,
      schedule: state[taskIndexToUpdate].schedule,
      isDone: status,
    );
  }
}
