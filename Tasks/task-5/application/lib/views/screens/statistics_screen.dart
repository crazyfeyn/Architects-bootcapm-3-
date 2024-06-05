import 'package:application/models/todo.dart';
import 'package:application/utils/app_constatnts.dart';
import 'package:application/views/widgets/navigation_rail.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

bool empytyText = false;

class _StatisticsScreenState extends State<StatisticsScreen> {
  int isCompletedTodosCount = 0;
  int unIsCompletedTodosCount = 0;

  void reportTodo() {
    setState(() {
      if (ToDo.list.isNotEmpty) {
        isCompletedTodosCount = 0;
        unIsCompletedTodosCount = 0;
        empytyText = false;
        unIsCompletedTodosCount = ToDo.list.length;
        for (var element in ToDo.list) {
          if (element.isDone) {
            isCompletedTodosCount++;
          }
        }
      } else {
        empytyText = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    reportTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: AppConstatnt.screenW > 600
              ? Row(
                  children: [
                    navigationRailWidget(context),
                    Text(
                      empytyText
                          ? 'there is nothing to see the statistics'
                          : '$isCompletedTodosCount todos are completed out of $unIsCompletedTodosCount todos',
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      empytyText
                          ? 'there is nothing to see the statistics'
                          : '$isCompletedTodosCount todos are completed out of $unIsCompletedTodosCount todos',
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
