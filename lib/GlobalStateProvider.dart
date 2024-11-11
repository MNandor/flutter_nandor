import 'package:flutter/material.dart';

class GlobalStateProvider with ChangeNotifier{
  int _fontMultiplier = 1;

  int get fontMultiplier => _fontMultiplier;

  void setFontMultiplier(int newValue){
    _fontMultiplier = newValue;
    notifyListeners();
  }

}