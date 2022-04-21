import 'package:flutter/foundation.dart';
import 'package:time_co_shoots_price/data/local_model/wedding_formula.dart';

class WeddingProvider extends ChangeNotifier {
  int selectedIndex = -1;
  late WeddingFormula weddingSelected;

  void selectWeddingFormula(WeddingFormula weddingFormula, int index) {
    selectedIndex = index;
    weddingSelected = weddingFormula;
    notifyListeners();
  }
}
