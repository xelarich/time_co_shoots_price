// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_printing_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoPrintingFormat _$PhotoPrintingFormatFromJson(Map<String, dynamic> json) =>
    PhotoPrintingFormat(
      json['id'] as int,
      format: json['format'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$PhotoPrintingFormatToJson(
        PhotoPrintingFormat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'format': instance.format,
      'price': instance.price,
    };
