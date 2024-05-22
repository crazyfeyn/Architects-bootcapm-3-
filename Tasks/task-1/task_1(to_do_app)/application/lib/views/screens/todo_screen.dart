import 'package:application/controllers/to_do_controllers.dart';
import 'package:application/views/widgets/to_do_add_dialog.dart';
import 'package:application/views/widgets/to_do_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

final ToDosController _toDosController = ToDosController();
// late Map<String, String> data =

class _ToDoScreenState extends State<ToDoScreen> {
  void toggleDone(int index) {
    setState(() {
      _toDosController.list[index].isDone =
          !_toDosController.list[index].isDone;
    });
  }

  void editToDo(int index, Map<String, String> data) {
    _toDosController.editToDo(index, data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
      ),
      body: ListView.builder(
          itemCount: _toDosController.list.length,
          itemBuilder: ((context, index) {
            return ToDoItem(
              toDo: _toDosController.list[index],
              toggleDone: () => toggleDone(index),
              index: index,
              editToDo: editToDo,
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, String>? data = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return const ToDoAddDialog();
              });
          if (data != null) {
            _toDosController.addToDo(data);
            setState(() {});
          }
        },
        child: const Icon(CupertinoIcons.plus),
      ),
    );
  }
}
