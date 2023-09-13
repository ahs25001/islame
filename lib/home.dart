import 'package:flutter/material.dart';
import 'package:islame2/quranScreen.dart';
import 'package:islame2/radio.dart';
import 'package:islame2/sebhaScreen.dart';
import 'package:islame2/settinsScreen.dart';

import 'hadethScreen.dart';

class Home extends StatefulWidget {
  static String routName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
List<Widget>bodies=[Quran(),Hadeth(),Sebha(),RadioFm(),Settings()];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Islame"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
              onTap: (value) {
                index=value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage('assets/images/quran_icon.png'), ),
                  label: "Quran",
                  backgroundColor: Color(0XFFB7935F),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ahadeth_icon.png')),
                  label: "Ahadeth",
                  backgroundColor: Color(0XFFB7935F),
                ),
                BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage('assets/images/sebha_icon.png')),
                  label: "Sebha",
                  backgroundColor: Color(0XFFB7935F),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio_icon.png')),
                  label: "Radio",
                  backgroundColor: Color(0XFFB7935F),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                  backgroundColor: Color(0XFFB7935F),
                ),
              ]),
          body: bodies[index],
        ),
      ],
    );
  }
}

