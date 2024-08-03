import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          TitleWidget('Title 1'),
          TitleWidget('Title 2'),
          TitleWidget('Title 2'),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget(
    this.title,
    {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: Colors.amber,
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
      ),
    );
  }
}
