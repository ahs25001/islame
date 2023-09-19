import 'package:flutter/material.dart';
import 'package:islame2/myThame.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style:(provider.locale=="en")? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: MyTheme.primary):Theme.of(context).textTheme.bodySmall,
                ),
                (provider.locale=="en")? const Icon(Icons.done):const SizedBox(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style: (provider.locale == "ar")
                      ? Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: MyTheme.primary)
                      : Theme.of(context).textTheme.bodySmall,
                ),
               (provider.locale=="ar")?const Icon(Icons.done):const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
