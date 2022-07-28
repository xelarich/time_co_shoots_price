import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  int selectedIndex = 3;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
