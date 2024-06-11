import 'package:application/views/screens/forgot_password_screen.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:application/views/screens/login_screen.dart';
import 'package:application/views/screens/register_screen.dart';

class AppRoutes {
  static final routes = {
    RouteNames.login: (ctx) => const LoginScreen(),
    RouteNames.register: (ctx) => RegisterScreen(),
    RouteNames.forgotPassword: (ctx) => const ForgotPasswordScreen(),
    RouteNames.home: (ctx) => const HomeScreen(),
  };
}

class RouteNames {
  static String home = '/home';
  static String login = '/login';
  static String register = '/register';
  static String forgotPassword = '/forgotPassword';
}
