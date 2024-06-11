import "package:application/models/product_model.dart";
import "package:json_annotation/json_annotation.dart";

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  int id;
  List<ProductModel> products;
  double totalPrice;
  DateTime date;
  String customerId;

  OrderModel(
      {required this.id,
      required this.products,
      required this.totalPrice,
      required this.date,
      required this.customerId});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  toJson() {
    return _$OrderModelToJson(this);
  }
}