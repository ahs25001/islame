import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SuraProvider extends ChangeNotifier{
  List<String> view = [];

  lodFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> aya = sura.split("\n");
    view = aya;
   notifyListeners();
  }
}