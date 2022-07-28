// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      number: json['number'] as int?,
      street: json['street'] as String? ?? "",
      city: json['city'] as String? ?? "",
      code: json['code'] as int?,
      extensionNumber: json['extensionNumber'] as String? ?? "",
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'number': instance.number,
      'extensionNumber': instance.extensionNumber,
      'street': instance.street,
      'city': instance.city,
      'code': instance.code,
    };
