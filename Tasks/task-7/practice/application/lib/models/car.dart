import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {
  int id;
  String name;
  String logo;
  int establishedYear;

  Car(
      {required this.id,
      required this.name,
      required this.logo,
      required this.establishedYear});

  factory Car.fromJson(Map<String, dynamic> json) {
    return _$CarFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CarToJson(this);
  }
}
