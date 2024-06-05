import 'package:application/models/my_course.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  final CourseModel course;
  const CourseItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/courseInfoScreen', arguments: course.lessons);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.network(
                    course.imageUrl,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          course.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          course.price.toString(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(course.description)
                  ],
                ),
              ),
            ],
          ),
        ));
    ;
  }
}
