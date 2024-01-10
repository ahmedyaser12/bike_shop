import 'package:flutter/widgets.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int navBarIndex = 0;
  int categoriesIndex = 0;

  void currentNavBarIndex(int index) {
    navBarIndex = index;
    notifyListeners();
  }void currentCategoriesIndex(int index) {
    categoriesIndex = index;
    notifyListeners();
  }
}
