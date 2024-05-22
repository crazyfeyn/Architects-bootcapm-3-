import 'package:application/models/to_do.dart';

class ToDosController {
  final List<ToDo> list = [
    ToDo(name: 'Wake up', time: 'Morning'),
    ToDo(name: 'Eat', time: 'Evening'),
    ToDo(name: 'Run', time: 'Tonight'),
    ToDo(name: 'Do my homework', time: 'After school'),
  ];

  void addToDo(Map<String, String> data) {
    list.add(ToDo(name: data['name']!, time: data['time']!));
  }

  void editToDo(int index, Map<String, String> data) {
    list[index].name = data['editedName']!;
    list[index].time = data['editedTime']!;
  }
}
