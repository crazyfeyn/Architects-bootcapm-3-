import 'package:application/models/product.dart';
import 'package:application/models/user.dart';
import 'package:application/services/product_http_service.dart';
import 'package:application/services/user_http_service.dart';

class UserController {
  final UserHttpService userHttpService = UserHttpService();

  List<User> list = [];
  Future<List<User>> getProducts() async {
    list = await userHttpService.getProducts();
    return list;
  }
}
