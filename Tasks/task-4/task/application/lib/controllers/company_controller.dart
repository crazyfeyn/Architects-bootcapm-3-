import 'dart:convert';

import 'package:application/models/company.dart';

class CompanyContoller {
  final List<Company> _list = [];

  List<Company> get list {
    return [..._list];
  }

  Future<void> getProducts() async {
    const String url = '''
      {
        "companyName": "Tech Solutions",
        "location": "San Francisco",
        "employee": [
          {
            "name": "Alice",
            "age": 30,
            "position": "Developer",
            "skills": ["Dart", "Flutter", "Firebase"]
          },
          {
            "name": "Bob",
            "age": 25,
            "position": "Designer",
            "skills": ["Photoshop", "Illustrator"]
          }
        ],
        "product": [
          {"name": "Product A", "price": 29.99, "inStock": true},
          {"name": "Product B", "price": 49.99, "inStock": false}
        ]
      }
     ''';
    Map<String, dynamic> data = jsonDecode(url);

    _list.add(Company.fromJson(data));
  }
}
