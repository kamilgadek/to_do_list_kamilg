import 'package:flutter/material.dart';
import 'package:local_storage/local_storage.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:to_do_list_kamilg/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const localStorage = LocalStorage();

  final tasksRepository = TasksRepository(
    localStorage: localStorage,
  );

  await tasksRepository.init();

  // Delete all lines below - it's just for development purposes
  tasksRepository.addTask(
    Task(
      id: '1',
      description: 'Umyj zęby',
      isDone: 1,
    ),
  );
  // final tasks = await tasksRepository.getTasks();
  // print(tasks);

  runApp(
    App(
      tasksRepository: tasksRepository,
    ),
  );
}
