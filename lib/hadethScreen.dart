import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame2/myThame.dart';

import 'hadethDitales.dart';
import 'hadethModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Hadeth extends StatefulWidget {
  static const String routName = 'hadeth';

  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<HadethModel> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      lodeAhadeth();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 33.0),
      child: Column(
        children: [
          Image.asset('assets/images/ahadeth_image.png'),
          Divider(
            color: MyTheme.primary,
            thickness: 3,
          ),
          Text(AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context).textTheme.bodyMedium),
          Divider(
            color: MyTheme.primary,
            thickness: 3,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDitales.routName,
                          arguments: ahadeth[index]);
                    },
                    child: Text(
                      ahadeth[index].title,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: MyTheme.primary,
                    endIndent: 40,
                    indent: 40,
                  );
                },
                itemCount: ahadeth.length),
          )
        ],
      ),
    );
  }

  lodeAhadeth() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadeth = hadethFile.split("#");
    for (int i = 0; i < hadeth.length; i++) {
      List<String> hadethLiens = hadeth[i].trim().split("\n");
      String title = hadethLiens[0];
      hadethLiens.removeAt(0);
      ahadeth.add(HadethModel(title: title, body: hadethLiens));
      setState(() {});
    }
  }
}
