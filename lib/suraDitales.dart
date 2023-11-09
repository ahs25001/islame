import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:islame2/providers/sura_provider.dart';
import 'package:islame2/suraModel.dart';
import 'package:provider/provider.dart';

class SouraDitalse extends StatefulWidget {
  static const String routName = 'Suora';

  @override
  State<SouraDitalse> createState() => _SouraDitalseState();
}

class _SouraDitalseState extends State<SouraDitalse> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    return Card(
      child: ChangeNotifierProvider(
        builder: (context, child) {
          var suraProvider=Provider.of<SuraProvider>(context);

          return  Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      (provider.mode == ThemeMode.light)
                          ? "assets/images/background.png"
                          : "assets/images/bg.png",
                    ),
                    fit: BoxFit.fill)),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  args.name,
                ),
              ),
              body: Card(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
                elevation: 3,
                margin: EdgeInsets.all(7),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Center(
                          child: Text(
                            "${suraProvider.view[index]}(${index + 1})",
                            textDirection: TextDirection.rtl,
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.black,
                        indent: 50,
                        endIndent: 50,
                      );
                    },
                    itemCount:suraProvider.view.length),
              ),
            ),
          );
        },
        create: (BuildContext context) {
          return SuraProvider()..lodFile(args.index);
        },
      ),
    );
  }


}
