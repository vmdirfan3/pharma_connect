import 'package:flutter/foundation.dart';

class ProductDetailController with ChangeNotifier {
  int _currentIndex = 0;
  int _cartValue = 1;

  int get cartValue => _cartValue;

  set cartValue(int value) {
    _cartValue = value;
    notifyListeners();
  }

  bool _isViewMore = false;

  bool get isViewMore => _isViewMore;

  set isViewMore(bool value) {
    _isViewMore = value;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

}
