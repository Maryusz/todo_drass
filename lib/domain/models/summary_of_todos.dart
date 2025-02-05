import 'package:todo_drass/domain/models/todo.dart';

class SummaryOfTodo {
  final Todo todo;

  SummaryOfTodo({
    required this.todo,
  });

  int lengthInDays() {
    return todo.endDate.difference(todo.startDate).inDays;
  }
}
