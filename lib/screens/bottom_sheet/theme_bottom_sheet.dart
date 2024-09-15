import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeMode("light");
              Navigator.pop(context);
            }
            ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: (provider.mode == ThemeMode.light)
                      ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary)
                      : Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                ),
                (provider.mode == ThemeMode.light) ? const Icon(Icons.done) : const SizedBox(),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              provider.changeMode("dark");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style: (provider.mode == ThemeMode.dark)
                      ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary)
                      : Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                ),
                (provider.mode == ThemeMode.dark) ? const Icon(Icons.done) : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
