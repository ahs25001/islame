import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame2/api_manager.dart';
import 'package:islame2/providers/RadioProvider.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../ResponseApi.dart';

class RadioFm extends StatefulWidget {
  static const String routName = 'radio';

  @override
  State<RadioFm> createState() => _RadioFmState();
}

class _RadioFmState extends State<RadioFm> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 412,
                  height: 222,
                  child: Image.asset('assets/images/radio_image.png')),
              Text(
                AppLocalizations.of(context)!.quranRadio,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              FutureBuilder(
                future: ApiManager.getData(provider.local),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    );
                  }
                  provider.radios = snapshot.data?.radios ?? [];
                  return Text(
                    provider.radios[provider.indexOfRadio].name ?? "",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  );
                },
              ),
              const SizedBox(
                height: 65,
              ),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        provider.playPrevious();
                        setState(() {});
                      },
                      icon: const ImageIcon(
                        AssetImage("assets/images/Icon metro-back.png"),
                      )),
                  IconButton(
                    onPressed: () {
                      if (!provider.isRadioPlay) {
                        provider.playRadio();
                        setState(() {});
                      } else {
                        provider.pauseRadio();
                        setState(() {});
                      }
                    },
                    icon: (!provider.isRadioPlay)
                        ? const ImageIcon(
                            AssetImage("assets/images/Icon awesome-play.png"),
                          )
                        : const Icon(Icons.pause, size: 35),
                  ),
                  IconButton(
                      onPressed: () {
                        provider.playNext();
                        setState(() {});
                      },
                      icon: const ImageIcon(
                        AssetImage("assets/images/Icon metro-next.png"),
                      )),
                ],
              )
            ],

        );
  }
}
