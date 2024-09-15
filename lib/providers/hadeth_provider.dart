import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../models/hadethModel.dart';

class HadethProvider extends ChangeNotifier{
  List<HadethModel> ahadeth = [];

  lodeAhadeth() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadeth = hadethFile.split("#");
    for (int i = 0; i < hadeth.length; i++) {
      List<String> hadethLiens = hadeth[i].trim().split("\n");
      String title = hadethLiens[0];
      hadethLiens.removeAt(0);
      ahadeth.add(HadethModel(title: title, body: hadethLiens));
     notifyListeners();
    }
  }
}