import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islame2/hadethDitales.dart';
import 'package:islame2/myThame.dart';
import 'package:islame2/suraDitales.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
