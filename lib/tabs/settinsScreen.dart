import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame2/bottom_sheet/language_bottom_sheet.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../bottom_sheet/theme_bottom_sheet.dart';

class Settings extends StatefulWidget {
  static const String routName = 'settings';

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: openLanguageSheet,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary)),
                child: (provider.local == "ar")
                    ? Text(AppLocalizations.of(context)!.arabic)
                    : Text(AppLocalizations.of(context)!.english)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.mode),
          InkWell(
            onTap: openThemeSheet,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary)),
                child: (provider.mode == ThemeMode.light)
                    ? Text(AppLocalizations.of(context)!.light)
                    : Text(AppLocalizations.of(context)!.dark)),
          ),
        ],
      ),
    );
  }

  openLanguageSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => const LanguageBottomSheet(),
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18), topLeft: Radius.circular(18))));
  }
  openThemeSheet(){
    showModalBottomSheet(
        context: context,
        builder: (context) => const ThemeBottomSheet(),
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18), topLeft: Radius.circular(18))));
  }
}
