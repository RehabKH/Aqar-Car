import 'package:flutter/cupertino.dart';

class DrawableSearch with ChangeNotifier {
  bool selectedSearch = false;

  changeDrawable(bool selectedSearch1) {
    selectedSearch = selectedSearch1;

    notifyListeners();
    print("current drawable: "+ selectedSearch1.toString());
    
  }
}
