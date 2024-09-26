import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ResponseApi.dart';

class MyProvider extends ChangeNotifier {
   String local ="en";
   ThemeMode mode =ThemeMode.light;
  SharedPreferences? sharedPreferences;

  changeLocal(String code) {
    local = code;
    notifyListeners();
    saveLocal(code);
  }

  Future<void> saveTheme(String theme) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("theme", theme);
    print("theme = $theme ===========================================");
  }

  Future<void> saveLocal(String code) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("local", code);
    print("local = $code ===========================================");
  }

  Future<void> loadLocal() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? newLocal = sharedPreferences!.getString("local");
    print("newLocal = $newLocal ===========================================");

    if (newLocal == null || newLocal == "ar") {
      print("newLocal in if = $newLocal ===========================================");

      local = "ar";
    } else {
      local = "en";
    }
  }

  Future<void> loadTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? newTheme = sharedPreferences!.getString("theme");
    print("newTheme = $newTheme ===========================================");
    if (newTheme == "light"||newTheme == null) {
      print("newTheme in if = $newTheme ===========================================");
      mode = ThemeMode.light;
      print ("provider mode in if = $mode =========================");
    } else {
      mode = ThemeMode.dark;
    }
  }

  changeMode(String mode) {
    this.mode = (mode == "light") ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
    saveTheme(mode);
  }
}
