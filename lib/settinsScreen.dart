import 'package:flutter/material.dart';
import 'package:islame2/bottom_sheet/language_bottom_sheet.dart';
import 'package:islame2/myThame.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:provider/provider.dart';

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
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: openLanguageBottomSheet,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: MyTheme.primary),
                    borderRadius: BorderRadius.circular(18)),
                child: Text(
                  (provider.locale == "ar")
                      ? AppLocalizations.of(context)!.arabic
                      : AppLocalizations.of(context)!.english,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: MyTheme.primary),
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
                "Lite",
                style: Theme.of(context).textTheme.bodySmall,
              )),
        ],
      ),
    );
  }

  openLanguageBottomSheet() {
    showModalBottomSheet(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18))),
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
    setState(() {});
  }
}
