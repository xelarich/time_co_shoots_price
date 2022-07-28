import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:time_co_shoots_price/data/converter/uint8list_converter.dart';
import 'package:time_co_shoots_price/data/local_model/address.dart';
import 'package:time_co_shoots_price/data/local_model/client.dart';

part 'authorization.g.dart';

@JsonSerializable()
class Authorization {
  Client client;
  Address address;
  String location;
  String dateTime;
  String locationSignature;
  String dateTimeSignature;
  @Uint8ListConverter()
  Uint8List? signature;

  Authorization(
      {required this.client,
      required this.address,
      this.location = "",
      this.dateTime = "",
      this.locationSignature = "",
      this.dateTimeSignature = "",
      this.signature});

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);
}
