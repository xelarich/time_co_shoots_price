import 'package:json_annotation/json_annotation.dart';

part 'photo_printing_format.g.dart';

@JsonSerializable()
class PhotoPrintingFormat{
  int id;
  String format;
  double price;

  PhotoPrintingFormat(this.id, {this.format = "", this.price = 0});

  factory PhotoPrintingFormat.fromJson(Map<String, dynamic> json) =>
      _$PhotoPrintingFormatFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoPrintingFormatToJson(this);


}