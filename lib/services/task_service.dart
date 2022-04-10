import 'package:my_day/data/sql_waitress.dart';
import 'package:my_day/models/task.dart';

class TaskService {
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

  Future<String> markTaskAsDone(int id) async {
    try {
      await SqlWaitress.updateTaskAsDone(id);

      return "success";
    } catch (e) {
      rethrow;
    }
  }
}
