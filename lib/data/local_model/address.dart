import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  int? number;
  String extensionNumber;
  String street;
  String city;
  int? code;

  Address(
      {this.number,
      this.street = "",
      this.city = "",
      this.code,
      this.extensionNumber = ""});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
