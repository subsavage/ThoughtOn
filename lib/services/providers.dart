import 'package:flutter/material.dart';

import '../screens/create-thought.dart';
import '../screens/homepage.dart';
import '../screens/thought-details.dart';

class Providers with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set updatedIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
