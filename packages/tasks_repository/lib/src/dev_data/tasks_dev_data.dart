import 'package:tasks_repository/tasks_repository.dart';

/// This is a development-only list of tasks.
/// TODO: Remove it later as it's for dev purposes only.
class TasksDevData {
  static List<Task> tasks = [
    Task('Learn Flutter', true),
    Task('Clean room', false),
    Task('Go to the gym', true),
  ];
}