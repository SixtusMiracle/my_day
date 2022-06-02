import 'package:my_day/data/sql_waitress.dart';
import 'package:my_day/models/task.dart';

class TaskService {
  /// Interacts with the [SqlWaitress]
  TaskService();

  List<Task> taskList = [];

  Future<List<Task>> getTasksFromDatabase() async {
    try {
      var response = await SqlWaitress.getAll();
      List itemCount = response;

      for (var item in itemCount) {
        taskList.add(Task.fromMap(item));
      }

      return taskList;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getBiggestIdFromTasksInDatabase() async {
    try {
      int response = await SqlWaitress.getBiggestIdFromTasks();

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> saveNewTask(Map<String, dynamic> newTask) async {
    try {
      int response = await SqlWaitress.createTask(newTask);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> deleteTaskFromDatabase(int id) async {
    try {
      await SqlWaitress.deleteTask(id);

      return "success";
    } catch (e) {
      rethrow;
    }
  }

  Future<String> setTaskStatusInDatabase(int id, bool isDone) async {
    try {
      await SqlWaitress.updateTaskStatus(id, isDone);

      return "success";
    } catch (e) {
      rethrow;
    }
  }
}
