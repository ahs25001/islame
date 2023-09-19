import 'package:flutter/material.dart';
import 'package:islame2/hadethDitales.dart';
import 'package:islame2/myThame.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:islame2/suraDitales.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.locale),
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
