import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioFm extends StatefulWidget {
  static const String routName = 'radio';

  @override
  State<RadioFm> createState() => _RadioFmState();
}

class _RadioFmState extends State<RadioFm> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
        SizedBox(
          height: 65,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage("assets/images/Icon metro-back.png"),
                )),
            IconButton(
              onPressed: () {
                isPlay = !isPlay;
                setState(() {});
              },
              icon: (isPlay)
                  ? ImageIcon(
                      AssetImage("assets/images/Icon awesome-play.png"),
                    )
                  : Icon(Icons.pause, size: 35),
            ),
            IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage("assets/images/Icon metro-next.png"),
                )),
          ],
        )
      ],
    );
  }
}
