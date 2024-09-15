import 'package:flutter/material.dart';
import 'package:islame2/models/hadethModel.dart';
import 'package:islame2/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../sheard/style/themes/myThame.dart';

class HadethDitalesScreen extends StatelessWidget {
  static const String routName = "hadethDitales";

  const HadethDitalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Card(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage( (provider.mode == ThemeMode.light)
                    ? "assets/images/background.png"
                    : "assets/images/bg.png",),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Card(
            color: (provider.mode == ThemeMode.light)
                ? Colors.white
                : MyTheme.blackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
            elevation: 3,
            margin: const EdgeInsets.all(7),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Center(
                      child: Text(
                    args.body[index],
                  ));
                },
                itemCount: args.body.length),
          ),
        ),
      ),
    );
  }
}
