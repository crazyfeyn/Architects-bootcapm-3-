import 'package:application/models/employee.dart';
import 'package:application/models/product.dart';

import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';

@JsonSerializable()
class Company {
  String companyName;
  String location;
  List<Employee> employee;
  List<Product> product;

  Company(
      {required this.companyName,
      required this.location,
      required this.employee,
      required this.product});

  factory Company.fromJson(Map<String, dynamic> json) {
    return _$CompanyFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CompanyToJson(this);
  }
}
