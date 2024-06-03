import 'dart:convert';

import 'package:application/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoHttpServices {
  Future<List<ToDo>> getTodo() async {
    Uri url =
        Uri.parse("https://oy-3-dars-6-default-rtdb.firebaseio.com/todo.json");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<ToDo> loadedTodo = [];
    if (data != null) {
      data.forEach((k, v) {
        v['id'] = k;
        loadedTodo.add(ToDo.fromJson(v));
      });
    }

    return loadedTodo;
  }

  Future<ToDo> addTodo(
      String date, String description, bool isCompleted, String title) async {
    Uri url =
        Uri.parse("https://oy-3-dars-6-default-rtdb.firebaseio.com/todo.json");
    Map<String, dynamic> todoData = {
      'date': date,
      'description': description,
      'isCompleted': isCompleted,
      'title': title
    };

    final response = await http.post(url, body: jsonEncode(todoData));

    final data = jsonDecode(response.body);
    todoData['id'] = data['name'];

    ToDo newTodo = ToDo.fromJson(todoData);
    return newTodo;
  }

  void toggleIsCompleted(bool isCompleted, String id){
    
  }

  Future<void> editTodo(String id, String newDate, String newDescription,
      bool newIsCompleted, String newTitle) async {
    Uri url =
        Uri.parse("https://oy-3-dars-6-default-rtdb.firebaseio.com/todo/$id.json");
    Map<String, dynamic> todoData = {
      'date': newDate,
      'description': newDescription,
      'isCompleted': newIsCompleted,
      'title': newTitle
    };

    await http.patch(url, body: jsonEncode(todoData));
  }

  Future<void> deleteTodo(String id) async {
    Uri url =
        Uri.parse("https://oy-3-dars-6-default-rtdb.firebaseio.com/todo.json");
    await http.delete(url);
  }
}
