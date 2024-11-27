import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasks_repository/tasks_repository.dart';
import 'package:to_do_list_kamilg/home/home.dart';
import 'package:app_ui/app_ui.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        tasksRepository: context.read<TasksRepository>(),
      ),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case HomeStatus.present:
            return _PresentView(
              tasks: state.tasks,
            );

          case HomeStatus.error:
            return const Center(
              // TODO(kamil): make it nicer
              child: Text('Error'),
            );
        }
      },
    );
  }
}

class _PresentView extends StatelessWidget {
  const _PresentView({
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO(kamil): add localization
        title: const Text('To Do List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskCard(
            task: task,
          );
        },
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          BottomAnimatedDialog.show(context, child: const Text(''));
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}

// class _TasksList extends StatelessWidget {
//   const _TasksList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
