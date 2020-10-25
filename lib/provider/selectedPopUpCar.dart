import 'package:flutter/cupertino.dart';

class CarsProvider with ChangeNotifier {
  String currentSelected;

  changepopUp(String currentSelected) {
    this.currentSelected = currentSelected;

    notifyListeners();
    print("current selected: "+ currentSelected.toString());
    
  }
}
