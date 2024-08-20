import 'package:chopper/chopper.dart';
import 'package:mobile_starter/feature/data/models/task.dart';
import 'package:mobile_starter/feature/data/services/task_service.dart';
import 'task_repository.dart';


class TaskRepositoryImpl implements TaskRepository {
  final TaskService taskService;

  TaskRepositoryImpl({required this.taskService});

  @override
  Future<Response<List<Task>>> getAllTasks({String? sort, String? filter}) async {
    final response = await taskService.getTasks(sort, filter);
    return response.copyWith(
      body: response.body?.map((json) => Task.fromJson(json)).toList(),
    );
  }

  @override
  Future<Response<Task>> getTask(int id, {String? sort, String? filter}) async {
    final response = await taskService.getTask(id, sort: sort, filter: filter);
    return response.copyWith(body: Task.fromJson(response.body));
  }

  @override
  Future<Response<void>> deleteTask(int id) async {
    return await taskService.deleteTask(id);
  }

  @override
  Future<Response<Task>> createTask(Task task) async {
    final response = await taskService.createTask(task);
    return response.copyWith(body: Task.fromJson(response.body));
  }

  @override
  Future<Response<Task>> updateTask(int id, Task task) async {
    final response = await taskService.updateTask(id, task);
    return response.copyWith(body: Task.fromJson(response.body));
  }

  @override
  Future<Response<Task>> archiveTask(int id) async {
    final response = await taskService.archiveTask(id);
    return response.copyWith(body: Task.fromJson(response.body));
  }
}
