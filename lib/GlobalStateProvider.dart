import 'package:flutter/material.dart';

class TextSizeSet{
  final double title;
  final double slogan;
  final double section;
  final double body;

  const TextSizeSet(this.title, this.slogan, this.section, this.body);
}

class GlobalStateProvider with ChangeNotifier{
  int _fontMultiplier = 1;

  int get fontMultiplier => _fontMultiplier;

  static const TextSizeSet bigSizes = TextSizeSet(72, 48, 32, 24);
  static const TextSizeSet smallSizes = TextSizeSet(54, 36, 24, 18);

  TextSizeSet sizes = bigSizes;

  void setFontMultiplier(bool makeItSmall){
    if (makeItSmall) {
      sizes = smallSizes;
    } else {
      sizes = bigSizes;
    }
    
    notifyListeners();
  }

}