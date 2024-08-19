import 'package:equatable/equatable.dart';
import 'package:mobile_starter/feature/data/models/task.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;

  const AddTask(this.task);

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;
  final int id;

  const UpdateTask(this.id, this.task);

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TaskEvent {
  final int taskId;

  const DeleteTask(this.taskId);

  @override
  List<Object?> get props => [taskId];
}
