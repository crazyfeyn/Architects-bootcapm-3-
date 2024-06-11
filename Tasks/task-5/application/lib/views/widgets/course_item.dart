import 'package:application/models/my_course.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  final CourseModel course;
  Function focoriteTapped;
  Function buyTapped;
  bool isFavorite;
  bool isBought;

  CourseItem({
    super.key,
    required this.course,
    required this.isFavorite,
    required this.focoriteTapped,
    required this.isBought,
    required this.buyTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/courseInfoScreen',
              arguments: course.lessons);
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
                    Text(course.description),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            buyTapped(course);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              isBought ? 'Bought' : 'Buy',
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              focoriteTapped(course);
                            },
                            icon: Icon(isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
    ;
  }
}
