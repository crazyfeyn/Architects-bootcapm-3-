import 'dart:ffi';

import 'package:application/models/todo.dart';
import 'package:application/viewmodels/todo_viewmodels.dart';
import 'package:application/views/widgets/manage_product_dialog.dart';
import 'package:application/views/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoViewModel todoViewModel = TodoViewModel();

  @override
  void initState() {
    super.initState();
  }

  Future<void> addProduct() async {
    final data = await showDialog(
        context: context, builder: (ctx) => const ManagaTodoDialog());
    if (data != null) {
      todoViewModel.addTodo(data['date'], data['description'],
          data['isCompleted'], data['title']);
    }
    setState(() {});
  }

  Future<void> editTodo(ToDo toDo) async {
    final data = await showDialog(
        context: context, builder: (ctx) => const ManagaTodoDialog());

    if (data != null) {
      todoViewModel.editTodo(data['id'], data['newDate'],
          data['newDescription'], data['newIsCompleted'], data['newTitle']);
    }
    setState(() {});
  }

  Future<void> deleteTodo(ToDo todo) async {
    todoViewModel.deleteTodo(todo.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: addProduct,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
          future: todoViewModel.list,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Mahsulotlar mavjud emas, iltimos qo'shing"),
              );
            }
            final todo = snapshot.data;
            return todo == null || todo.isEmpty
                ? const Center(
                    child: Text("Mahsulotlar mavjud emas, iltimos qo'shing"),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: todo.length,
                    itemBuilder: (ctx, index) {
                      final toDo = todo[index];
                      return TodoItem(
                          toDo: toDo,
                          onEdit: () => editTodo(toDo),
                          onDelete: () => deleteTodo(toDo));
                    },
                  );
          }),
    );
  }
}
