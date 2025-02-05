import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:todo_drass/data/repositories/todo_repository.dart';
import 'package:todo_drass/domain/models/todo.dart';

class TodoViewModel extends ChangeNotifier {
  TodoViewModel({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  final TodoRepository _todoRepository;

  final List<Todo> _todos = [];
  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  Future<void> getTodo() async {
    final todo = await _todoRepository.getTodo();
    _todos.add(todo);
    notifyListeners();
  }

  // Add your ViewModel code here
}
