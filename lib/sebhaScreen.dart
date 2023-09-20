import 'package:flutter/material.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:provider/provider.dart';

class Sebha extends StatefulWidget {
  static const routName = 'sebha';

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "لاحول ولا قوة الا بالله"
  ];

  int index = 0;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 50, start: 90, end: 90),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                if (counter >= 33 && index < azkar.length - 1) {
                  counter = 0;
                  index++;
                } else if (counter >= 33 && index >= azkar.length - 1) {
                  counter = 0;
                  index = 0;
                } else {
                  counter++;
                }
                setState(() {});
              },
              child: Image.asset((provider.mode == "light")
                  ? "assets/images/sebha.png"
                  : "assets/images/sebha_dark.png")),
          SizedBox(
            height: 32,
          ),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          SizedBox(
            height: 34,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(23)),
            width: 69,
            height: 81,
            child: Center(
              child: Text(
                "$counter",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
              decoration: BoxDecoration(
                  color:Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(23)),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                textAlign: TextAlign.center,
                azkar[index],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )),
        ],
      ),
    );
  }
}
