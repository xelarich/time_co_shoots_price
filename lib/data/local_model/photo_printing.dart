import 'package:json_annotation/json_annotation.dart';

part 'photo_printing.g.dart';

@JsonSerializable()
class PhotoPrinting {
  int id;
  String name;
  List<PhotoSize> sizes;
  bool isExpanded;

  PhotoPrinting(this.id, this.name,
      {this.sizes = const [], this.isExpanded = false});

  PhotoPrinting clone() => PhotoPrinting(id, name, sizes: []);

  factory PhotoPrinting.fromJson(Map<String, dynamic> json) =>
      _$PhotoPrintingFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoPrintingToJson(this);
}

@JsonSerializable()
class PhotoSize {
  int id;
  String format;
  double price;
  int quantities;

  PhotoSize(this.id, this.format, this.price, {this.quantities = 0});

  PhotoSize.fromPhotoSize(PhotoSize photoSize, int value)
      : id = photoSize.id,
        format = photoSize.format,
        price = photoSize.price,
        quantities = value;

  factory PhotoSize.fromJson(Map<String, dynamic> json) =>
      _$PhotoSizeFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoSizeToJson(this);
}
