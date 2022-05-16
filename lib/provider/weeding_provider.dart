import 'package:flutter/foundation.dart';
import 'package:time_co_shoots_price/data/local_model/photo_printing.dart';
import 'package:time_co_shoots_price/data/local_model/wedding_formula.dart';

class WeddingProvider extends ChangeNotifier {
  int selectedIndex = -1;
  WeddingFormula? weddingSelected;
  List<PhotoPrinting> photoPrintingList = [];

  void selectWeddingFormula(WeddingFormula weddingFormula, int index) {
    selectedIndex = index;
    weddingSelected = weddingFormula;
    notifyListeners();
  }

  void updateWeddingPhoto(
      PhotoPrinting photoPrinting, PhotoSize photoSize, int value) {
    PhotoPrinting newPhotoPrinting = photoPrinting.clone();
    PhotoSize newPhotoSize = PhotoSize.fromPhotoSize(photoSize, value);
    final indexPhoto = photoPrintingList
        .indexWhere((element) => element.name == photoPrinting.name);
    if (indexPhoto != -1) {
      final indexSize = photoPrintingList[indexPhoto]
          .sizes
          .indexWhere((element) => element.format == photoSize.format);
      if (indexSize != -1) {
        if (value == 0) {
          photoPrintingList[indexPhoto].sizes.removeAt(indexSize);
          if (photoPrintingList[indexPhoto].sizes.isEmpty) {
            photoPrintingList.removeAt(indexPhoto);
          }
        } else {
          photoPrintingList[indexPhoto].sizes[indexSize] = newPhotoSize;
        }
      } else {
        photoPrintingList[indexPhoto].sizes.add(newPhotoSize);
      }
    } else {
      newPhotoPrinting.sizes.add(newPhotoSize);
      photoPrintingList.add(newPhotoPrinting);
    }
    notifyListeners();
  }

  double? getTotalWedding() {
    if (weddingSelected == null || weddingSelected!.price == null) {
      return null;
    } else {
      double total = weddingSelected!.price!.toDouble();
      for (var photo in photoPrintingList) {
        for (var size in photo.sizes) {
          total += size.price * size.quantities;
        }
      }
      return total;
    }
  }

  String getInitialValue(PhotoPrinting photoPrinting, PhotoSize photoSize) {
    for (var photo in photoPrintingList) {
      if (photo.name == photoPrinting.name) {
        for (var size in photo.sizes) {
          if (size.format == photoSize.format) {
            return size.quantities.toString();
          }
        }
      }
    }
    return "";
  }

  void reset() {
    photoPrintingList = [];
  }
}
