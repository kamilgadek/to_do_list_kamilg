import 'package:flutter/material.dart';
import 'package:local_storage/local_storage.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:to_do_list_kamilg/home/home.dart';
import 'package:app_ui/app_ui.dart';
class TasksPage extends StatelessWidget {
  TasksPage({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final tasks = TasksDevData.tasks;
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: ListView.builder(
        itemCount: TasksDevData.tasks.length,
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
