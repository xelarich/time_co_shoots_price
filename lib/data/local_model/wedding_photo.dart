import 'package:json_annotation/json_annotation.dart';
import 'package:time_co_shoots_price/data/local_model/photo_printing.dart';

part 'wedding_photo.g.dart';

@JsonSerializable()
class WeddingPhoto {
  int quantities;
  PhotoPrinting photoPrinting;

  WeddingPhoto(this.quantities, this.photoPrinting);
  factory WeddingPhoto.fromJson(Map<String, dynamic> json) =>
      _$WeddingPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$WeddingPhotoToJson(this);
}