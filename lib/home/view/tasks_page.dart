import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:to_do_list_kamilg/home/home.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          width: 400,
          child: TaskCard(
          /// TODO(kamil): for dev purposes only
            task: TasksDevData.tasks.first,
          ),
        ),
      ),
    );
  }
}
