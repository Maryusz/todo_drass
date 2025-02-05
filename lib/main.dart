import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'package:todo_drass/data/repositories/todo_repository.dart';
import 'package:todo_drass/data/services/api_service.dart';
import 'package:todo_drass/ui/todo/view_model/todo_view_model.dart';
import 'package:todo_drass/ui/todo/widgets/todo_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => Dio()),
      Provider(create: (context) => ApiService(dio: context.read())),
      Provider(create: (context) => TodoRepository(apiService: context.read<ApiService>())),

      // Change Notifier Provider
      ChangeNotifierProvider(create: (context) => TodoViewModel(todoRepository: context.read<TodoRepository>())),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialPage(),
      routes: {
        "/todo": (context) => TodoScreen(viewModel: context.read()),
      },
    );
  }
}

class InitialPage extends StatelessWidget {
  const InitialPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Go to another page!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/todo");
              },
              child: const Text('Go to Todo Page'),
            ),
          ],
        ),
      ),
    );
  }
}

// Main topics to see and learn
// 1. Provider
// 2. MVVM architecture https://docs.flutter.dev/app-architecture/case-study
