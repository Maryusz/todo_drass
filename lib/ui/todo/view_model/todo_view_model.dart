import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_command/flutter_command.dart';

import 'package:todo_drass/data/repositories/todo_repository.dart';
import 'package:todo_drass/domain/models/todo.dart';

class TodoViewModel extends ChangeNotifier {
  TodoViewModel({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository {
    // To fulfill the promise to the compiler that we will instantiate the command attribute,
    // we intantiate it inside the constructor.
    getTodoCommand = Command.createAsyncNoParam<void>(
      initialValue: null,
      () => _getTodo(),
    );

    get100TodosCommand = Command.createAsyncNoParam<void>(
      initialValue: null,
      () => _get100Todos(),
    );
  }

  // The todo repository instance provided by the dependency injection container.
  final TodoRepository _todoRepository;

  // The internal list of todos which are retrived from the repo.
  final List<Todo> _todos = [];
  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  // Property
  int get todosCount => _todos.length;

  // All the commands that can be executed by the view model.
  late final Command getTodoCommand;
  late final Command get100TodosCommand;

  Future<void> _getTodo() async {
    int i = Random().nextInt(100);
    if (i > 80) {
      throw Exception('Random Exception');
    }

    final todo = await _todoRepository.getTodo();
    _todos.add(todo);
    notifyListeners();
  }

  Future<void> _get100Todos() async {
    for (int i = 0; i < 100; i++) {
      _todos.add(await _todoRepository.getTodo());
      // uncomment to see the progress
      // notifyListeners();
    }

    // this updates it at the end
    notifyListeners();
  }
}
