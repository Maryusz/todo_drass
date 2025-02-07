import 'package:flutter/material.dart';

import '../view_model/todo_view_model.dart';

class TodoScreen extends StatelessWidget {
  final TodoViewModel viewModel;

  const TodoScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) {
              return Badge.count(
                count: viewModel.todosCount,
                child: const Text('Todo List'),
              );
            }),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              viewModel.get100TodosCommand.execute();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: 400,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: viewModel.get100TodosCommand.isExecuting,
                builder: (context, v, _) {
                  return v ? LinearProgressIndicator() : Text("Press the refresh button to get 100 todos");
                },
              ),
            ),
          ),
          Expanded(
            child: ListenableBuilder(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.getTodoCommand.execute();

          viewModel.getTodoCommand.errors.addListener(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("An error occurred!"),
              ),
            );
          });
        },
        child: ValueListenableBuilder(
          valueListenable: viewModel.getTodoCommand.isExecuting,
          builder: (context, v, _) {
            return v ? CircularProgressIndicator() : Icon(Icons.add);
          },
        ),
      ),
    );
  }
}
