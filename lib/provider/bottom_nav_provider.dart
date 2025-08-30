import 'package:flutter/cupertino.dart';

class BottomNavProvider extends ChangeNotifier {
  int _indexBottomBar = 0;

  int get indexBottomBar => _indexBottomBar;

  set setIndexBottombar(int value) {
    _indexBottomBar = value;
    notifyListeners();
  }
}
