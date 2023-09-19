import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";
  String mode = "light";

  changeLocal(String code) {
    local = code;
    notifyListeners();
  }

  changeMode(String mode) {
    this.mode = mode;
    notifyListeners();
  }
}