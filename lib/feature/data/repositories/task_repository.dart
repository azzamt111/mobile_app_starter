import 'package:chopper/chopper.dart';
import 'package:mobile_starter/feature/data/models/task.dart';

abstract class TaskRepository {
  Future<Response<List<Task>>> getAllTasks({String? sort, String? filter});
  Future<Response<Task>> getTask(int id, {String? sort, String? filter});
  Future<Response<void>> deleteTask(int id);
  Future<Response<Task>> createTask(Task task);
  Future<Response<Task>> updateTask(int id, Task task);
  Future<Response<Task>> archiveTask(int id);
}