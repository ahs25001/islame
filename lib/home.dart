import 'package:flutter/material.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:islame2/tabs/quranScreen.dart';
import 'package:islame2/tabs/radio.dart';
import 'package:islame2/tabs/sebhaScreen.dart';
import 'package:islame2/tabs/settinsScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'tabs/hadethScreen.dart';
class Home extends StatefulWidget {
  static String routName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
List<Widget>bodies=[Quran(),Hadeth(),Sebha(),RadioFm(),Settings()];
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          (provider.mode=="light")?
          'assets/images/background.png':'assets/images/bg.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
              onTap: (value) {
                index=value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage('assets/images/quran_icon.png'), ),
                  label: AppLocalizations.of(context)!.quranIconName,
                  backgroundColor:Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ahadeth_icon.png')),
                  label: AppLocalizations.of(context)!.ahadethIconName,
                  backgroundColor:Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage('assets/images/sebha_icon.png')),
                  label: AppLocalizations.of(context)!.sebhaIconName,
                  backgroundColor:Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio_icon.png')),
                  label: AppLocalizations.of(context)!.radioIconName,
                  backgroundColor:Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settingsIconName,
                  backgroundColor:Theme.of(context).colorScheme.primary,
                ),
              ]),
          body: bodies[index],
        ),
      ],
    );
  }
}

