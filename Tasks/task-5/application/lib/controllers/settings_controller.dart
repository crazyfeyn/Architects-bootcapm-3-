import 'package:application/models/settings.dart';
import 'package:application/models/todo.dart';
import 'package:application/utils/app_constatnts.dart';
import 'package:flutter/material.dart';

class SettingsController with ChangeNotifier {
  final Settings settings = Settings(themeMode: ThemeMode.system);

  void toggleSwitch(bool isDark) {
    if (isDark) {
      settings.themeMode = ThemeMode.dark;
    } else {
      settings.themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  void toggleCheck(int id) {
    ToDo.list[id].isDone = !ToDo.list[id].isDone;

    notifyListeners();
  }

  void addTodo(ToDo todo) {
    ToDo.list.add(todo);
    notifyListeners();
  }

  void deleteTodo(ToDo toDo) {
    ToDo.list.remove(toDo);

    notifyListeners();
  }

  void updateContents(String newContents) {
    AppConstatnt.contents = newContents;

    notifyListeners();
  }

  void updateTodo(ToDo todo) {
    int index = ToDo.list.indexWhere((element) => element.id == todo.id);
    if (index != -1) {
      ToDo.list[index] = todo;
    }
    notifyListeners();
  }

  void changeBottomIndex(int index) {
    AppConstatnt.curBottomIndex = index;
    notifyListeners();
  }

  void changeIsAdd() {
    AppConstatnt.isAdd = !AppConstatnt.isAdd;
    notifyListeners();
  }

  void setW(double screenW) {
    AppConstatnt.screenW = screenW;
  }
}
