import 'package:tasks_repository/tasks_repository.dart';

/// This is a development-only list of tasks.
/// TODO: Remove it later as it's for dev purposes only.
class TasksDevData {
  static  List<Task> tasks= [
    Task(
      title: 'Task 1',
      description: 'Lear Flutter',
      isDone: true,
    ),
    Task(
      title: 'Task 2',
      description: 'Clean room',
      isDone: true,
    ),
    Task(
      title: 'Task 3',
      description: 'Go to the gym',
      isDone: false,
    ),
  ];
}