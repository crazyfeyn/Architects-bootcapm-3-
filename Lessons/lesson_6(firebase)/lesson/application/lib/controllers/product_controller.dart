import 'package:application/models/product.dart';
import 'package:application/services/product_http_service.dart';

class ProductController {
  List<Product> list = [];

  final productHttpService = ProductHttpService();
  Future<List<Product>> getProducts() async {
    list = await productHttpService.getProducts();

    return list;
  }
}
