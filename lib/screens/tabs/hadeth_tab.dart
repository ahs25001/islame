import 'package:flutter/material.dart';
import 'package:islame2/providers/home_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../hadeth_ditales_screen.dart';

class Hadeth extends StatelessWidget {
  static const String routName = 'hadeth';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 33.0),
      child: ChangeNotifierProvider(
        create: (context) => HomeProvider()..lodeAhadeth(),
        builder: (context, child) {
          var hadethProvider = Provider.of<HomeProvider>(context);
          return Column(
            children: [
              Image.asset('assets/images/ahadeth_image.png'),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                thickness: 3,
              ),
              Text(AppLocalizations.of(context)!.ahadeth,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                thickness: 3,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, HadethDitalesScreen.routName,
                              arguments: hadethProvider.ahadeth[index]);
                        },
                        child: Text(
                          hadethProvider.ahadeth[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Theme.of(context).colorScheme.secondary,
                        endIndent: 40,
                        indent: 40,
                      );
                    },
                    itemCount: hadethProvider.ahadeth.length),
              )
            ],
          );
        },
      ),
    );
  }
}
