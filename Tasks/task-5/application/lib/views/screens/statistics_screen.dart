import 'package:application/models/todo.dart';
import 'package:application/utils/app_constatnts.dart';
import 'package:application/views/widgets/navigation_rail.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int isCompletedTodosCount = 0;
  int unIsCompletedTodosCount = 0;
  void reportTodo() {
    for (var element in ToDo.list) {
      if (element.isDone) {
        isCompletedTodosCount++;
      }
    }

    unIsCompletedTodosCount = ToDo.list.length;
  }

  @override
  Widget build(BuildContext context) {
    reportTodo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistic screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: AppConstatnt.screenW > 600
              ? Row(
                  children: [
                    navigationRailWidget(context),
                    Text(
                      '$isCompletedTodosCount todos are completed out of $unIsCompletedTodosCount todos',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      '$isCompletedTodosCount todos are completed out of $unIsCompletedTodosCount todos',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
