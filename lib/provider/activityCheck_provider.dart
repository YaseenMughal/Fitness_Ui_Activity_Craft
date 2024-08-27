import 'package:flutter/material.dart';

class ActivityCheckProvider extends ChangeNotifier {
  List<bool> activities = List.generate(6, (_) => false);

  void toggleActivites(int index) {
    activities[index] = !activities[index];
    notifyListeners();
  }

  void addActivites() {
    activities.add(true);
    notifyListeners();
  }
}
