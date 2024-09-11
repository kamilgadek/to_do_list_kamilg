import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:to_do_list_kamilg/home/home.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
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
    );
  }
}
