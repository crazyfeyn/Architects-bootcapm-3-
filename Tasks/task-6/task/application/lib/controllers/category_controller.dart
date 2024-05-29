import 'package:application/models/category.dart';
import 'package:application/services/category_https_service.dart';

class CategoryController {
  final CategoryHttpService categoryHttpService = CategoryHttpService();

  List<Category> list = [];
  Future<List<Category>> getProducts() async {
    list = await categoryHttpService.getProducts();
    return list;
  }
}
