import 'dart:convert';

import 'package:application/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductHttpServices {
  List<Product1> generalProductList = [];

  // ProductModel productModel = ProductModel(product1: product1);
  Future<List<Product1>> getData() async {
    Uri url = Uri.parse(
        'https://first-token-api-lesson-default-rtdb.firebaseio.com/Product.json');
    final response = await http.get(url);

    final data = jsonDecode(response.body);
    if (data != null && data.isNotEmpty) {
      data.forEach((key, value) {
        generalProductList.add(Product1.fromJson(value));
      });

      return generalProductList;
    }
    return [];
  }

  
}
