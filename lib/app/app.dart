import 'package:flutter/material.dart';
import 'package:to_do_list_kamilg/home/view/view.dart';


/// TODO(kamil): create App class here and use it in main.dart 

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TasksPage(),
    );
  }
}