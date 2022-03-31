import 'package:json_annotation/json_annotation.dart';

part 'wedding_type.g.dart';

@JsonSerializable()
class WeddingType {
  int? id;
  String? name;
  String? description;
  int? price;

  WeddingType({this.id, this.name, this.description, this.price});

  factory WeddingType.fromJson(Map<String, dynamic> json) =>
      _$WeddingTypeFromJson(json);

  Map<String, dynamic> toJson() => _$WeddingTypeToJson(this);
}

