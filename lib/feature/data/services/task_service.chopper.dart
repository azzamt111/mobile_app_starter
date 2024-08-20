// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$TaskService extends TaskService {
  _$TaskService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = TaskService;

  @override
  Future<Response<List<dynamic>>> getTasks(
    String? sort,
    String? filter,
  ) {
    final Uri $url = Uri.parse('/todos');
    final Map<String, dynamic> $params = <String, dynamic>{
      'sort': sort,
      'filter': filter,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> getTask(
    int id, {
    String? sort,
    String? filter,
  }) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'sort': sort,
      'filter': filter,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createTask(Task task) {
    final Uri $url = Uri.parse('/todos/');
    final $body = task;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateTask(
    int id,
    Task task,
  ) {
    final Uri $url = Uri.parse('/todos/${id}');
    final $body = task;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<void>> deleteTask(int id) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<void, void>($request);
  }

  @override
  Future<Response<dynamic>> archiveTask(int id) {
    final Uri $url = Uri.parse('/todos/${id}/archive');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
