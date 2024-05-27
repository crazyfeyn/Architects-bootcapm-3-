
import 'package:application/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            formatDescription(product.description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.orange,
                  ),
                  Text(
                    "${product.rate}/${product.count}",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDescription(String text) {
    return "${text.substring(0, 60)}...";
  }
}
