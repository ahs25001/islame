import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islame2/providers/home_provider.dart';
import 'package:islame2/providers/sura_provider.dart';
import 'package:islame2/screens/hadeth_ditales_screen.dart';
import 'package:islame2/sheard/style/themes/myThame.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:islame2/screens/sura_ditales_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  var provider=MyProvider();
  await provider.loadTheme();
  await provider.loadLocal();
  runApp(MultiProvider(
    providers: [
     ChangeNotifierProvider(create: (context) => MyProvider(),),
     ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ],
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
      locale: Locale(provider.local),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        SouraDitalse.routName: (context) => SouraDitalse(),
        HadethDitalesScreen.routName: (context) => HadethDitalesScreen(),
      },
      themeMode: provider.mode,
      initialRoute: HomeScreen.routName,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
    );
  }
}
