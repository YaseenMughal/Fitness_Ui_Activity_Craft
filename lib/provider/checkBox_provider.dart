import 'package:flutter/material.dart';

class CheckBoxProvider extends ChangeNotifier {
  bool checkBox1 = true;
  bool checkBox2 = false;
  bool checkBox3 = true;
  bool checkBox4 = false;

  void toggleCheckBox1() {
    checkBox1 = !checkBox1;
    notifyListeners();
  }

  void toggleCheckBox2() {
    checkBox2 = !checkBox2;
    notifyListeners();
  }

  void toggleCheckBox3() {
    checkBox3 = !checkBox3;
    notifyListeners();
  }

  void toggleCheckBox4() {
    checkBox4 = !checkBox4;
    notifyListeners();
  }
}
