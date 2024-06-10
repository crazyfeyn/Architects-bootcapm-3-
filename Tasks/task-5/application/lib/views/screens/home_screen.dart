import 'package:application/utils/app_constatnts.dart';
import 'package:application/views/screens/note_screen.dart';
import 'package:application/views/screens/todo_screen.dart';
import 'package:application/views/widgets/navigation_rail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isTodo = true;
  bool isNote = false;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    tabController.addListener(() {
      setState(() {});
    });
  }

  void changeTodoNote(String value) {
    setState(() {
      if (value == 'isTodo') {
        isTodo = true;
        isNote = false;
      } else if (value == 'isNote') {
        isNote = true;
        isTodo = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/loginScreen');
            },
            icon: Icon(Icons.arrow_left_rounded)),
        backgroundColor: const Color(0xFFFDE49E),
        title: tabController.index == 0
            ? const Text(
                "Todos",
                style: TextStyle(
                  color: Color(0xFFDD761C),
                ),
              )
            : const Text(
                "Notes",
                style: TextStyle(
                  color: Color(0xFFDD761C),
                ),
              ),
        centerTitle: true,
        bottom: TabBar(
          dividerColor: const Color(0xFFFDE49E),
          indicatorColor: const Color(0xFFDD761C),
          labelColor: const Color(0xFF03AED2),
          controller: tabController,
          tabs: const [
            Tab(
              text: "Todos",
              icon: Icon(
                Icons.check_box_outlined,
              ),
            ),
            Tab(
              text: "Notes",
              icon: Icon(Icons.note),
            )
          ],
        ),
      ),
      body: AppConstatnt.screenW > 600
          ? Row(
              children: [
                navigationRailWidget(context),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [TodoScreen(), NotePage()],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [TodoScreen(), NotePage()],
                  ),
                ),
              ],
            ),
    );
  }
}
