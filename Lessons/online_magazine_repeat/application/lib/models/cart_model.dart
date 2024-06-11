import 'package:application/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  String id;
  List<ProductModel> products;
  double totalPrice;
  String customerId;

  CartModel(
      {required this.id,
      required this.products,
      required this.totalPrice,
      required this.customerId});
}
