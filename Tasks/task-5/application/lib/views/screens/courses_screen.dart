import 'package:application/models/my_course.dart';
import 'package:application/services/course_http_services.dart';
import 'package:application/views/widgets/course_item.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late List<CourseModel> data;
  CourseHttpServices courseHttpServices = CourseHttpServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: courseHttpServices.getCourses(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.data}'),
            );
          }
          if (!snapshot.hasData) {
            const Center(
              child: Text('underfined datas'),
            );
          }
          final List<CourseModel> courses = snapshot.data;

          return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: courses.length,
              itemBuilder: ((context, index) {
                final course = courses[index];
                return CourseItem(course: course);
              }));
        },
      ),
    );
  }
}
