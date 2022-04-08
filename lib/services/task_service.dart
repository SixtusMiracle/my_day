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
}
