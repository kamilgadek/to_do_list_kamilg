import 'package:flutter/material.dart';
import 'package:to_do_list_kamilg/home/view/task_list_item.dart';

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
      body: const TaskListItem(),
      
    );
  }
}
