import 'package:flutter/material.dart';

class ActivityCheckProvider extends ChangeNotifier {
  List<bool> activities = List.generate(6, (_) => true);

  void toggleActivites(int index) {
    activities[index] = !activities[index];
    notifyListeners();
  }

  void addActivites() {
    activities.add(true);
    notifyListeners();
  }
















  
  // bool activity1 = true;
  // bool activity2 = true;
  // bool activity3 = true;
  // bool activity4 = true;
  // bool activity5 = true;
  // bool activity6 = true;

  // void toggleActivity1() {
  //   activity1 = !activity1;
  //   notifyListeners();
  // }

  // void toggleActivity2() {
  //   activity2 = !activity2;
  //   notifyListeners();
  // }

  // void toggleActivity3() {
  //   activity3 = !activity3;
  //   notifyListeners();
  // }

  // void toggleActivity4() {
  //   activity4 = !activity4;
  //   notifyListeners();
  // }

  // void toggleActivity5() {
  //   activity5 = !activity5;
  //   notifyListeners();
  // }

  // void toggleActivity6() {
  //   activity6 = !activity6;
  //   notifyListeners();
  // }
}
