import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:to_do_list_kamilg/home/widgets/task_list.dart';

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
        child: TaskCard( task: Task('Lers Flutter', true),
        ),
      ),
      
    );
  }
}
