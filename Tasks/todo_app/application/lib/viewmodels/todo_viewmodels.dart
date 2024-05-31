import 'package:application/models/todo.dart';
import 'package:application/repositories/todo_repository.dart';
import 'package:flutter/material.dart';

class TodoViewModel {
  final TodoRepositories todoRepositories = TodoRepositories();
  List<ToDo> _list = [];

  Future<List<ToDo>> get list async {
    _list = await todoRepositories.getTodos();
    return [..._list];
  }

  void addTodo(
      String date, String description, bool isCompleted, String title) async {
    final newTodo =
        await todoRepositories.addTodo(date, description, isCompleted, title);
    _list.add(newTodo);
  }

  void editTodo(String id, String newDate, String newDescription,
      bool newIsCompleted, String newTitle) async {
    await todoRepositories.editTodo(
        id, newDate, newDescription, newIsCompleted, newTitle);

    final index = _list.indexWhere((element) => element.id == id);
    _list[index].title = newTitle;
    _list[index].date = newDate;
    _list[index].description = newDescription;
    _list[index].isCompleted = newIsCompleted;
  }

  void deleteTodo(String id) async {
    await todoRepositories.deleteTodo(id);
    _list.removeWhere((element) => element.id == id);
  }
}
