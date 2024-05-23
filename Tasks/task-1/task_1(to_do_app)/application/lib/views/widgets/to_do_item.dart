import 'package:application/models/to_do.dart';
import 'package:application/views/widgets/to_do_edit_dialog.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  final Function toggleDone;
  final int index;
  final Function editToDo;
  final Function() onDelete;
  const ToDoItem(
      {required this.toDo,
      required this.toggleDone,
      required this.index,
      required this.editToDo,
      required this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        toDo.name,
        style: TextStyle(
            color: toDo.isDone ? Colors.red : Colors.black,
            decoration: toDo.isDone ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w500,
            fontSize: 22),
      ),
      subtitle: Text(toDo.time.toString()),
      leading: IconButton(
        onPressed: () {
          toggleDone();
        },
        icon: Icon(toDo.isDone
            ? Icons.check_box_rounded
            : Icons.check_box_outline_blank),
        color: Colors.green,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () async {
              Map<String, String>? data = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) {
                    return ToDoEditDialog(name: toDo.name, time: toDo.time);
                  });
              if (data != null) {
                editToDo(index, data);
              }
            },
            icon: const Icon(Icons.edit),
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () {
              onDelete();
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
