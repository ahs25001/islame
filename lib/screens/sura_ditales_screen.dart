import 'package:flutter/material.dart';
import 'package:islame2/sheard/style/themes/myThame.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:islame2/models/suraModel.dart';
import 'package:provider/provider.dart';

class SouraDitalse extends StatelessWidget {
  static const String routName = 'Suora';

  String prepareSoura(List<String> ayat) {
    String soura = "";
    for (int index = 0; index < ayat.length; index++) {
      soura = soura + "${ayat[index]} (${index + 1}) ";
    }
    return soura;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    return Card(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  (provider.mode == ThemeMode.light)
                      ? "assets/images/background.png"
                      : "assets/images/bg.png",
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.name,
            ),
          ),
          body: Card(
            color: (provider.mode == ThemeMode.light)
                ? Colors.white
                : MyTheme.blackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
            elevation: 3,
            margin: const EdgeInsets.all(7),
            child: ListView(
              children: [
                Text(
                  prepareSoura(args.ayat),
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
