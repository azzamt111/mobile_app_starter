import 'package:chopper/chopper.dart';
import 'package:mobile_starter/feature/data/models/task.dart';

part 'task_service.chopper.dart';

@ChopperApi(baseUrl: '/tasks')
abstract class TaskService extends ChopperService {

  @Get(path: '/')
  Future<Response<List>> getTasks({
    @Query('sort') String? sort,          // Example: 'createdAt', '-priority'
    @Query('filter') String? filter,      // Example: 'priority:high'
  });

  @Get(path: '/{id}')
  Future<Response> getTask(
    @Path('id') int id, {
    @Query('sort') String? sort,          // Optional sort query parameter
    @Query('filter') String? filter,      // Optional filter query parameter
  });

  @Post(path: '/')
  Future<Response> createTask(@Body() Task task);

  @Put(path: '/{id}')
  Future<Response> updateTask(@Path('id') int id, @Body() Task task);

  @Delete(path: '/{id}')
  Future<Response<void>> deleteTask(@Path('id') int id);

  @Put(path: '/{id}/archive')
  Future<Response> archiveTask(@Path('id') int id);

  static TaskService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://your-api.com'),
      services: [_$TaskService()],
      converter: JsonConverter(),
      errorConverter: JsonConverter(),
    );
    return _$TaskService(client);
  }
}
