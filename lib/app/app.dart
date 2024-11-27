import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:to_do_list_kamilg/home/home.dart';

class App extends StatelessWidget {
  const App({
    required TasksRepository tasksRepository,
    super.key,
  }) : _tasksRepository = tasksRepository;

  final TasksRepository _tasksRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _tasksRepository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TasksPage(),
      ),
    );
  }
}
