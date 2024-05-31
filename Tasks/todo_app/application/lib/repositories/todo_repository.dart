import 'package:application/models/todo.dart';
import 'package:application/services/todo_http_service.dart';

class TodoRepositories {
  final todoHttpServices = TodoHttpServices();

  Future<List<ToDo>> getTodos() async {
    return todoHttpServices.getTodo();
  }

  Future<ToDo> addTodo(
      String date, String description, bool isCompleted, String title) async {
    final newTodo =
        await todoHttpServices.addTodo(date, description, isCompleted, title);
    return newTodo;
  }

  Future<void> editTodo(String id, String newDate, String newDescription,
      bool newIsCompleted, String newTitle) async {
    todoHttpServices.editTodo(
        id, newDate, newDescription, newIsCompleted, newTitle);
  }

  Future<void> deleteTodo(String id) async {
    await todoHttpServices.deleteTodo(id);
  }
}
