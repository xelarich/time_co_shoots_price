// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wedding_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeddingType _$WeddingTypeFromJson(Map<String, dynamic> json) => WeddingType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$WeddingTypeToJson(WeddingType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
    };
