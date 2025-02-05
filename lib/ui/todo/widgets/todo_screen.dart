import 'package:flutter/material.dart';

import '../view_model/todo_view_model.dart';

class TodoScreen extends StatelessWidget {
  final TodoViewModel viewModel;

  const TodoScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return ListView.builder(
            itemCount: viewModel.todos.length,
            itemBuilder: (context, index) {
              final todo = viewModel.todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await viewModel.getTodo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
