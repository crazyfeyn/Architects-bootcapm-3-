import 'dart:convert';

import 'package:application/models/product.dart';
import 'package:http/http.dart' as http;

class ProductController {
  final List<Product> _list = [];

  List<Product> get list {
    return [..._list];
  }

  Future<void> getProducts() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Not found');
      }
      List<Map<String, dynamic>> data =
          jsonDecode(response.body).cast<Map<String, dynamic>>();
      for (var i in data) {
        _list.add(Product.fromJson(i));
      }
    } catch (e) {
      print(e);
    }
  }
}
