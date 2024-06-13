import 'dart:convert';
import 'package:application/models/my_course.dart';
import 'package:http/http.dart' as http;

class CourseHttpServices {
  Future<List<CourseModel>> getCourses() async {
    Uri url = Uri.parse(
        "https://couse-45ad0-default-rtdb.firebaseio.com/Courses.json");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<CourseModel> loadedCourses = [];
    if (data != null) {
      data.forEach((key, value) {
        value['id'] = key;
        loadedCourses.add(CourseModel.fromJson(value));
      });
    }
    return loadedCourses;
  }
}