import 'package:flutter/material.dart';
import 'package:islame2/providers/home_provider.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame2/screens/tabs/hadeth_tab.dart';
import 'package:islame2/screens/tabs/quran_tab.dart';
import 'package:islame2/screens/tabs/radio_tab.dart';
import 'package:islame2/screens/tabs/sebha_tab.dart';
import 'package:islame2/screens/tabs/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String routName = "Home";

  List<Widget> bodies = [
    Quran(),
    Hadeth(),
    Sebha(),
    RadioFm(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var appProvider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          (appProvider.mode == ThemeMode.light)
              ? 'assets/images/background.png'
              : 'assets/images/bg.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.currentIndex,
              onTap: (value) {
                provider.changeIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/quran_icon.png'),
                  ),
                  label: AppLocalizations.of(context)!.quranIconName,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ahadeth_icon.png')),
                  label: AppLocalizations.of(context)!.ahadethIconName,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha_icon.png')),
                  label: AppLocalizations.of(context)!.sebhaIconName,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio_icon.png')),
                  label: AppLocalizations.of(context)!.radioIconName,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settingsIconName,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ]),
          body: bodies[provider.currentIndex],
        ),
      ],
    );
  }
}
