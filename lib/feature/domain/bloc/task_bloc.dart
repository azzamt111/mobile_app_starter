import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_starter/feature/data/repositories/task_repository.dart';
import 'package:mobile_starter/feature/domain/bloc/task_event.dart';
import 'package:mobile_starter/feature/domain/bloc/task_state.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final response = await taskRepository.getAllTasks();
      emit(TaskLoaded(response.body ?? []));
    } catch (e) {
      emit(TaskError('Failed to load tasks'));
    }
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    try {
      await taskRepository.createTask(event.task);
      add(LoadTasks());
    } catch (e) {
      emit(TaskError('Failed to add task'));
    }
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    try {
      await taskRepository.updateTask(event.id, event.task);
      add(LoadTasks());
    } catch (e) {
      emit(TaskError('Failed to update task'));
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    try {
      await taskRepository.deleteTask(event.taskId);
      add(LoadTasks());
    } catch (e) {
      emit(TaskError('Failed to delete task'));
    }
  }
}
