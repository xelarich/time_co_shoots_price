// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) =>
    Authorization(
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      location: json['location'] as String? ?? "",
      dateTime: json['dateTime'] as String? ?? "",
      locationSignature: json['locationSignature'] as String? ?? "",
      dateTimeSignature: json['dateTimeSignature'] as String? ?? "",
      signature: _$JsonConverterFromJson<List<int>, Uint8List>(
          json['signature'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'client': instance.client,
      'address': instance.address,
      'location': instance.location,
      'dateTime': instance.dateTime,
      'locationSignature': instance.locationSignature,
      'dateTimeSignature': instance.dateTimeSignature,
      'signature': _$JsonConverterToJson<List<int>, Uint8List>(
          instance.signature, const Uint8ListConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
