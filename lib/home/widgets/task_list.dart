import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
    this.task,
    {
    super.key,
  });

  final String task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: Colors.amber,
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Text(
        task,
      ),
    );
  }
}
