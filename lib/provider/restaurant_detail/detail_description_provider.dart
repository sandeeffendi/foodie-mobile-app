import 'package:flutter/material.dart';

class DetailDescriptionProvider extends ChangeNotifier {
  bool _isDescriptionExpanded = false;

  get isDescriptionExpanded => _isDescriptionExpanded;

  void onPresssed() {
    _isDescriptionExpanded = !_isDescriptionExpanded;
    notifyListeners();
  }
}
