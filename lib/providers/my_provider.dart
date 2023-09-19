import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier{
  String locale ='en';
  changeLanguage(String code)
  {
    locale=code;
    notifyListeners();
  }
}