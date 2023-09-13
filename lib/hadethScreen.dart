import 'package:flutter/material.dart';

class Hadeth extends StatelessWidget {
  static const String routName='hadeth';
  const Hadeth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Hadeth",style: Theme.of(context).textTheme.bodyLarge,));
  }
}
