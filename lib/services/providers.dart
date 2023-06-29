import 'package:flutter/material.dart';

class Providers with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set updatedIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final _controller = TextEditingController();
  get controller => _controller;
}
