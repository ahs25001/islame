import 'package:flutter/material.dart';
import 'package:islame2/myThame.dart';

class Hadeth extends StatelessWidget {
  static const String routName='hadeth';
  const Hadeth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 33.0),
      child: Column(
        children: [
          Image.asset('assets/images/ahadeth_image.png'),
          Divider(
            color: MyTheme.primary,
            thickness: 3,
          ),
          Text("Ahadeth",style: Theme.of(context).textTheme.bodyMedium),
          Divider(
            color: MyTheme.primary,
            thickness: 3,
          ),
        ],
      ),
    );
  }
  addAhadeth(){

  }
}
