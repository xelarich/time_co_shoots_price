import 'package:flutter/foundation.dart';

class BottomBarProvider extends ChangeNotifier {
  int selectedIndex = 1;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}