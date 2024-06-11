import 'package:application/models/my_course.dart';
import 'package:flutter/material.dart';

class AppConstatnt {
  static String contents = "";
  static int curBottomIndex = 0;
  static List<Widget> bigScreenList = [];
  static bool isAdd = false;
  static double screenW = 0;
  static String token = "";
  static List<CourseModel> boughtCourses = [];
  static List<CourseModel> favorites = [];
  static bool isBought = false;
  static bool isFavorite = false;
}
