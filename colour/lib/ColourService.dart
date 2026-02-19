import 'package:flutter/material.dart';

class ColourService extends ChangeNotifier{
  int redTapCount = 0;
  int blueTapCount = 0;
  
  void redPlus () {
    redTapCount++;
    notifyListeners();
  }

  void bluePlus () {
    blueTapCount++;
    notifyListeners();
  }
}