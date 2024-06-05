import 'package:application/models/my_course.dart';
import 'package:flutter/material.dart';

class Courseinfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Lessons lessons = ModalRoute.of(context)!.settings.arguments as Lessons;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 221, 34),
      appBar: AppBar(
        title: const Text(
          'Lessons',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 241, 221, 34),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                final lesson = lessons.lesson1;
                return Column(
                  children: [
                    ListTile(
                      title: Text(lesson.title),
                      subtitle: Text(lesson.courseSeld),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/quizScreen',
                            arguments: lesson.quizes);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(13),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'quiz',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/videoScreen',
                            arguments: lesson.videoUrl);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(13),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'course video',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                );
              })),
    );
  }
}
