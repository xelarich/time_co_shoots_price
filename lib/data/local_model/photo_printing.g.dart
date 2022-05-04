// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_printing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoPrinting _$PhotoPrintingFromJson(Map<String, dynamic> json) =>
    PhotoPrinting(
      json['id'] as int,
      json['name'] as String,
      sizes: (json['sizes'] as List<dynamic>?)
              ?.map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PhotoPrintingToJson(PhotoPrinting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sizes': instance.sizes,
    };

PhotoSize _$PhotoSizeFromJson(Map<String, dynamic> json) => PhotoSize(
      json['id'] as int,
      json['format'] as String,
      (json['price'] as num).toDouble(),
      quantities: json['quantities'] as int? ?? 0,
    );

Map<String, dynamic> _$PhotoSizeToJson(PhotoSize instance) => <String, dynamic>{
      'id': instance.id,
      'format': instance.format,
      'price': instance.price,
      'quantities': instance.quantities,
    };
