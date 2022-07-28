// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      name: json['name'] as String?,
      firstname: json['firstname'] as String?,
      mail: json['mail'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'name': instance.name,
      'firstname': instance.firstname,
      'mail': instance.mail,
      'phoneNumber': instance.phoneNumber,
    };
