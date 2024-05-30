import 'package:application/models/product.dart';
import 'package:application/services/product_http_service.dart';

class ProductRepository {
  final productHttpService = ProductHttpService();

  Future<List<Product>> getProducts() async {
    return productHttpService.getProducts();
  }

  Future<Product> addProduct(String title, double price, int amount) async {
    final newProduct =
        await productHttpService.AddProduct(title, price, amount);

    return newProduct;
  }

  Future<void> editProduct(
      String id, String newTitle, double newPrice, int newAmount) async {
    await productHttpService.editProduct(id, newTitle, newPrice, newAmount);
  }

  Future<void> deleteProduct(String id) async {
    await productHttpService.deleteProduct(id);
  }
}
