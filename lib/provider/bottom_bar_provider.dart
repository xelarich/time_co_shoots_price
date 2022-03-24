import 'package:flutter/foundation.dart';

class BottomBarProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}