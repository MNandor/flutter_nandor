import 'package:flutter/material.dart';

class TextSizeSet{
  final int title;
  final int slogan;
  final int section;
  final int body;

  TextSizeSet(this.title, this.slogan, this.section, this.body);
}

class GlobalStateProvider with ChangeNotifier{
  int _fontMultiplier = 1;

  int get fontMultiplier => _fontMultiplier;

  TextSizeSet sizes = TextSizeSet(72, 48, 32, 24);
  TextSizeSet smallSizes = TextSizeSet(54, 36, 24, 18);

  void setFontMultiplier(int newValue){
    _fontMultiplier = newValue;
    notifyListeners();
  }

}