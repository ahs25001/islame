import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String routName='settings';
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Settings",style: Theme.of(context).textTheme.bodyLarge,));
  }
}
