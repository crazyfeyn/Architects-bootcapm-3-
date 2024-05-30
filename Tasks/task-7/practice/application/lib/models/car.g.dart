// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logo: json['logo'] as String,
      establishedYear: (json['establishedYear'] as num).toInt(),
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'establishedYear': instance.establishedYear,
    };
