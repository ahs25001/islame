import 'package:flutter/material.dart';
import 'package:islame2/providers/home_provider.dart';
import 'package:islame2/screens/sura_ditales_screen.dart';
import 'package:islame2/models/suraModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Quran extends StatelessWidget {
  static const String routName = 'quran';
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/quran_image.png'),
          Table(
            border: TableBorder.all(
              width: 3,
              color: Theme.of(context).colorScheme.secondary,
            ),
            children: [
              TableRow(children: [
                Text(
                  textAlign: TextAlign.center,
                  AppLocalizations.of(context)!.suraName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppLocalizations.of(context)!.numberOfAyat,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ]),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suraNames.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider(
                  create: (context) {
                    return HomeProvider()..lodFile(index);
                  },
                  builder: (context, child) {
                    var provider = Provider.of<HomeProvider>(context);
                    return Table(
                      border: TableBorder(
                          verticalInside: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 3)),
                      children: [
                        TableRow(children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SouraDitalse.routName,
                                  arguments: SuraModel(
                                      ayat: provider.view,
                                      name: suraNames[index],
                                      index: index));
                            },
                            child: Text(
                              suraNames[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            provider.view.length.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                            textAlign: TextAlign.center,
                          )
                        ])
                      ],
                    );
                  },
                );
              },
            ),
          )

          // Expanded(
          //   child: ListView.separated(
          //     itemCount: suraNames.length,
          //     separatorBuilder: (context, index) => Divider(
          //       color: Theme.of(context).colorScheme.secondary,
          //       endIndent: 40,
          //       indent: 40,
          //     ),
          //     itemBuilder: (context, index) => InkWell(
          //       onTap: () {
          //         Navigator.pushNamed(context, SouraDitalse.routName,
          //             arguments:
          //                 SuraModel(name: suraNames[index], index: index));
          //       },
          //       child: Text(
          //         suraNames[index],
          //         style: Theme.of(context)
          //             .textTheme
          //             .bodySmall!
          //             .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
