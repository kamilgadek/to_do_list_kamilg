import 'package:flutter/material.dart';
import 'package:local_storage/local_storage.dart';
import 'package:to_do_list_kamilg/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localStorage = LocalStorage.instance;

  // Initialize the database
  await localStorage.getDatabase();

  // Add task
  await localStorage.addTask("Test Task");
  print("Task added.");

  // Get all tasks
  final tasks = await localStorage.getTasks();
  print("All tasks: $tasks");

  // Edit task
  if (tasks.isNotEmpty) {
    final taskId = tasks.first['id'];
    await localStorage.editTask(taskId, "Updated Task", 1);
    print("Task edited.");

    // Get tasks afrted edited
    final updatedTasks = await localStorage.getTasks();
    print("Tasks after edit: $updatedTasks");

    // Delete task
    await localStorage.deleteTask(taskId);
    print("Task deleted.");

    // Get tesks after deleted
    final tasksAfterDelete = await localStorage.getTasks();
    print("Tasks after delete: $tasksAfterDelete");
  }

  runApp(const App());
}
