import 'package:flutter/material.dart';

import 'feature/view/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

/// TODO(kamil): name it App class and move it to separate folder (under lib)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TasksPage(),
    );
  }
}
