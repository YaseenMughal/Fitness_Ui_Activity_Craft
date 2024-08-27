import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarProvider extends ChangeNotifier {
  int _pageIndex = 2;

  int get pageIndex => _pageIndex;

  int getcartItemCount(BuildContext context) {
    // Provide the logic to calculate the cart item count based on your requirements
    return Provider.of(context).cartItems.length;
  }

  void setpageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}