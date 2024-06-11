import 'package:meta/meta.dart';
import 'dart:convert';

class ProductModel {
    final Product1 product1;

    ProductModel({
        required this.product1,
    });

    factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        product1: Product1.fromJson(json["product1"]),
    );

    Map<String, dynamic> toJson() => {
        "product1": product1.toJson(),
    };
}

class Product1 {
    final int amount;
    final int id;
    final String imageurl;
    final bool isFavorite;
    final double price;
    final String title;

    Product1({
        required this.amount,
        required this.id,
        required this.imageurl,
        required this.isFavorite,
        required this.price,
        required this.title,
    });

    factory Product1.fromRawJson(String str) => Product1.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product1.fromJson(Map<String, dynamic> json) => Product1(
        amount: json["amount"],
        id: json["id"],
        imageurl: json["imageurl"],
        isFavorite: json["isFavorite"],
        price: json["price"]?.toDouble(),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "id": id,
        "imageurl": imageurl,
        "isFavorite": isFavorite,
        "price": price,
        "title": title,
    };
}
