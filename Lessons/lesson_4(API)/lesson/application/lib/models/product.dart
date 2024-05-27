import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  dynamic rate;
  dynamic count;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rate,
      required this.count});

  // factory Product.fromJson(json) {
  //   return Product(
  //       id: json['id'],
  //       title: json['title'],
  //       price: json['price'],
  //       description: json['description'],
  //       category: json['category'],
  //       image: json['image'],
  //       rate: json['rating']['rate'],
  //       count: json['rating']['count']);
  // }

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  // factory Product.toJson(Product instance) {
  //   return _$ProductToJson(instance);
  // }
}
