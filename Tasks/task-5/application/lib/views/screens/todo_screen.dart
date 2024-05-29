import 'package:application/controllers/settings_controller.dart';
import 'package:application/models/todo.dart';
import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/views/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  void addTodo(ToDo todo) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      SettingsNotifier.of(context).addTodo(todo);
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String title = "";
  String desc = "";
  String date = "";

  String copyTitle = "";
  String copyDesc = "";
  String copyDate = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'To do',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: ToDo.list.length,
                  itemBuilder: (context, index) {
                    final todo = ToDo.list[index];
                    return ListTile(
                      leading: Text(
                        todo.id.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      title: Text(todo.title),
                      subtitle: Text("${todo.desc}\nDue: ${todo.date}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(todo.isDone
                              ? Icons.check_box
                              : Icons.check_box_outline_blank_outlined),
                          IconButton(
                              onPressed: () {
                                SettingsNotifier.of(context).deleteTodo(todo);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('edit todo'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Form(
                                              key: _formKey,
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    initialValue: copyTitle,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      label: Text('title'),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value
                                                              .trim()
                                                              .isEmpty) {
                                                        return 'please enter todo';
                                                      } else {
                                                        setState(() {
                                                          title = value;
                                                        });
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    initialValue: copyDesc,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      label:
                                                          Text('description'),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value
                                                              .trim()
                                                              .isEmpty) {
                                                        return 'please enter description';
                                                      } else {
                                                        setState(() {
                                                          desc = value;
                                                        });
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    initialValue: copyDate,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      label: Text('data'),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value
                                                              .trim()
                                                              .isEmpty) {
                                                        return 'please enter data';
                                                      } else {
                                                        setState(() {
                                                          date = value;
                                                        });
                                                      }
                                                      return null;
                                                    },
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                setState(() {
                                                  _titleController.clear();
                                                  _descController.clear();
                                                  _dateController.clear();

                                                  Navigator.of(context).pop();
                                                });
                                                SettingsNotifier.of(context)
                                                    .updateTodo(ToDo(
                                                        id: ToDo.list.length,
                                                        title: title,
                                                        desc: desc,
                                                        date: date,
                                                        isDone: false));
                                              }
                                            },
                                            child: const Text('Save'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                      onTap: () {
                        SettingsNotifier.of(context).toggleCheck(todo.id - 1);
                      },
                    );
                  }),
            ),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text('Add todo'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _titleController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('title'),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'please enter todo';
                                      } else {
                                        setState(() {
                                          title = value;
                                          copyTitle = title;
                                        });
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _descController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('description'),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'please enter description';
                                      } else {
                                        setState(() {
                                          desc = value;
                                          copyDesc = desc;
                                        });
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _dateController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('data'),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'please enter data';
                                      } else {
                                        setState(() {
                                          date = value;
                                          copyDate = date;
                                        });
                                      }
                                      return null;
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                setState(() {
                                  _titleController.clear();
                                  _descController.clear();
                                  _dateController.clear();

                                  Navigator.of(context).pop();
                                });
                                SettingsNotifier.of(context).addTodo(ToDo(
                                    id: ToDo.list.length + 1,
                                    title: title,
                                    desc: desc,
                                    date: date,
                                    isDone: false));
                              }
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      );
                    });
              },
              child: const Icon(CupertinoIcons.add),
            )
          ],
        ),
      ),
    );
  }
}
