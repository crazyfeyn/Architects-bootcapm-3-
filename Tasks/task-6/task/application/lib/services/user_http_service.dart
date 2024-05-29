import 'dart:convert';
import 'package:application/models/user.dart';
import 'package:http/http.dart' as http;

class UserHttpService {
  Future<List<User>> getProducts() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");

    final response = await http.get(url);
    final List<dynamic> data = jsonDecode(response.body);

    List<User> loadProducts = [];

    if (data.isNotEmpty) {
      for (var item in data) {
        loadProducts.add(User(email: item['email'], avatar: item['avatar']));
      }
    }

    return loadProducts;
  }
}
