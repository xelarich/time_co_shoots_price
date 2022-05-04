// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wedding_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeddingPhoto _$WeddingPhotoFromJson(Map<String, dynamic> json) => WeddingPhoto(
      json['quantities'] as int,
      PhotoPrinting.fromJson(json['photoPrinting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeddingPhotoToJson(WeddingPhoto instance) =>
    <String, dynamic>{
      'quantities': instance.quantities,
      'photoPrinting': instance.photoPrinting,
    };
