import 'dart:math';

import 'package:application/models/todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final ToDo toDo;
  final Function onEdit;
  final Function onDelete;
  const TodoItem({super.key, required this.toDo, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.primaries[Random().nextInt(17)],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                toDo.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Description: ${toDo.description}",
              ),
            ],
          ),
          Text(
            "${toDo.date}",
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: onEdit(),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                label: const Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: onDelete(),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text("Delete",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
