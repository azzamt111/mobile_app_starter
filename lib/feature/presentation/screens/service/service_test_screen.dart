import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_starter/feature/data/repositories/task_repository_impl.dart';
import 'package:mobile_starter/feature/data/services/task_service.dart';
import 'package:mobile_starter/feature/domain/bloc/task_bloc.dart';
import 'package:mobile_starter/feature/domain/bloc/task_event.dart';
import 'package:mobile_starter/feature/domain/bloc/task_state.dart';
import 'package:mobile_starter/feature/presentation/widgets/test_widget.dart';

class ServiceTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskService = TaskService.create();
    final taskRepository = TaskRepositoryImpl(taskService: taskService);

    return BlocProvider(
      create: (context) => TaskBloc(taskRepository),
      child: ServiceTestScreenComponent(),
    );
  }
}

class ServiceTestScreenComponent extends StatefulWidget {
  const ServiceTestScreenComponent({super.key});

  @override
  State<ServiceTestScreenComponent> createState() => _ServiceTestScreenComponentState();
}

class _ServiceTestScreenComponentState extends State<ServiceTestScreenComponent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            TestWidget(
              size: size, 
              buttonText: "getAllTasks", 
              submitFunction: getAllTasksFunction,
            ),
            Container(
              height: 200,
              width: size.width - 50,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    if (state is TaskLoaded) {
                      debugPrint(state.tasks.toString());
                      return ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          return Text(state.tasks[index].title ?? "No title");
                        },
                      );
                    } else if (state is TaskLoading) {
                      return const Center(
                        child: SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(color: Colors.black)
                          ),
                        ) 
                      );
                    } else {
                      return const Text('No Tasks Loaded');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getAllTasksFunction(bool param) async {
    context.read<TaskBloc>().add(LoadTasks());
  }
}
