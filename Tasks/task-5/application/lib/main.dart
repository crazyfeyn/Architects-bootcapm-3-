import 'package:application/controllers/settings_controller.dart';
import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/services/course_http_services.dart';
import 'package:application/views/screens/course_info.dart';
import 'package:application/views/screens/courses_screen.dart';
import 'package:application/views/screens/forgot_password.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:application/views/screens/main_screen.dart';
import 'package:application/views/screens/note_screen.dart';
import 'package:application/views/screens/profile_screen.dart';
import 'package:application/views/screens/quiz_screen.dart';
import 'package:application/views/screens/login.dart';
import 'package:application/views/screens/sign_up.dart';
import 'package:application/views/screens/statistics_screen.dart';
import 'package:application/views/screens/todo_screen.dart';
import 'package:application/views/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CourseHttpServices courseHttpServices = CourseHttpServices();

  Future<void> checker() async {
    await courseHttpServices.getCourses();
  }

  bool isChecked = false;

  Future<void> checkToken() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    String? storedExpiryDate = sharedPreference.getString('expiryDate');
    if (storedExpiryDate != null) {
      DateTime expiryDate = DateTime.parse(storedExpiryDate);
      DateTime now = DateTime.now();

      if (expiryDate.isBefore(now)) {
        setState(() {
          isChecked = true;
        });
      }
    }
    
  }

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    checker();
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
        designSize: Size(
          screenW,
          screenH,
        ),
        child: SettingsNotifier(
          settingsController: SettingsController(),
          child: Builder(builder: (context) {
            SettingsNotifier.of(context).setW(screenW);
            return ListenableBuilder(
              listenable: SettingsNotifier.of(context),
              builder: ((context, child) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    darkTheme: ThemeData.dark(),
                    initialRoute: isChecked ? '/loginScreen' : '/',
                    routes: {
                      '/': (context) => const MainScreen(),
                      '/todoScreen': (context) => const TodoScreen(),
                      '/coursesScreen': (context) => const CoursesScreen(),
                      '/homeScreen': (context) => const HomeScreen(),
                      '/noteScreen': (context) => NotePage(),
                      '/profileScreen': (context) => const ProfileScreen(),
                      '/statisticsScreen': (context) =>
                          const StatisticsScreen(),
                      '/courseInfoScreen': (context) => Courseinfo(),
                      '/quizScreen': (context) => const QuizScreen(),
                      '/videoScreen': (context) => const VideoScreen(),
                      '/loginScreen': (context) => const LoginScreen(),
                      '/signUpScreen': (context) => SignupScreen(),
                      '/forgotPasswordScreen': (context) =>
                          const ForgotPasswordScreen(),
                    },
                  )),
            );
          }),
        ));
  }
}
