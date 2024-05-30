import 'package:application/models/product.dart';
import 'package:application/repositories/product_repository.dart';

class ProductsViewModel {
  final productRepository = ProductRepository();

  List<Product> _list = [
    Product(
      id: "1",
      title: "iPhone 11",
      price: 900,
      amount: 22,
    ),
  ];

  Future<List<Product>> get list async {
    _list = await productRepository.getProducts();
    return [..._list];
  }

  void addProduct(String title, double price, int amount) async {
    final newProduct = await productRepository.addProduct(title, price, amount);
    _list.add(newProduct);
  }

  void editProduct(String id, String newTitle, double newPrice, int newAmount) {
    productRepository.editProduct(id, newTitle, newPrice, newAmount);
    final index = _list.indexWhere((product) {
      return product.id == id;
    });

    _list[index].title = newTitle;
    _list[index].price = newPrice;
    _list[index].amount = newAmount;
  }

  Future<void> deleteProduct(String id) async {

    await productRepository.deleteProduct(id);
    _list.removeWhere((product) {
      return product.id == id;
    });
  }
}
