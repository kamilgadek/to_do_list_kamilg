import 'package:flutter/material.dart';
import 'package:to_do_list_kamilg/home/widgets/task_list.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          TaskCard('Title 1'),
          TaskCard('Title 2'),
          TaskCard('Title 1'),
        ],
      ),
    );
  }
}

