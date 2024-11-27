import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            task.description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            // TODO(Kamil): what is that??
            task.isTaskDone ? "Completed" : "Incomplete",
            style: TextStyle(
              fontSize: 16,
              color: task.isTaskDone ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
