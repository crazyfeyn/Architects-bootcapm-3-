import 'package:application/models/product.dart';
import 'package:application/services/product_http_service.dart';
import 'package:http/retry.dart';

class ProductController {
  final ProductHttpService productHttpService = ProductHttpService();

  List<Product> list = [];
  Future<List<Product>> getProducts() async {
    list = await productHttpService.getProducts();
    return list;
  }
}
