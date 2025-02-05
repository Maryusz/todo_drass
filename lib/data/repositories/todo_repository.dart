import 'package:todo_drass/data/services/api_service.dart';
import 'package:todo_drass/domain/models/todo.dart';

class TodoRepository {
  final ApiService _apiService;

  TodoRepository({required ApiService apiService}) : _apiService = apiService;

  Future<Todo> getTodo() async {
    final todoData = await _apiService.fetchData();

    final todo = Todo(
      id: todoData.data['id'],
      title: "TODO # ${todoData.data['id']}",
      description: todoData.data['todo'],
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 1)),
    );
    return todo;
  }
}
