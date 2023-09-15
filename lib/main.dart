import 'package:flutter/material.dart';
import 'package:islame2/hadethDitales.dart';
import 'package:islame2/hadethScreen.dart';
import 'package:islame2/myThame.dart';
import 'package:islame2/quranScreen.dart';
import 'package:islame2/radio.dart';
import 'package:islame2/sebhaScreen.dart';
import 'package:islame2/settinsScreen.dart';
import 'package:islame2/suraDitales.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routName: (context) => Home(),
       SouraDitalse.routName:(context) => SouraDitalse(),
        HadethDitales.routName:(context) => HadethDitales(),
      },
      initialRoute: Home.routName,
      theme: MyTheme.light,
    );
  }
}
