import 'package:flutter/material.dart';
import 'package:to_do_list_kamilg/home/home.dart';
/// TODO(kamil): for dev purposes only

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
          child: TaskCard(task: TasksDevData.tasks[0]),
          ),
        ),
      );
  }
}
