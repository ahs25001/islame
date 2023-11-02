import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";
  ThemeMode mode = ThemeMode.system;
  SharedPreferences? sharedPreferences;

  changeLocal(String code) {
    local = code;
    notifyListeners();
    saveLocal(code);
  }

  Future<void> saveTheme(String theme) async {
    await sharedPreferences!.setString("theme", theme);
  }

  Future<void> saveLocal(String code) async {
    await sharedPreferences!.setString("local", code);
  }

  loadLocal()async {
    sharedPreferences=await SharedPreferences.getInstance();
    String ? newLocal=sharedPreferences!.getString("local");
    if(newLocal==null||newLocal=="ar")
      {
        local="ar";
      }
    else{
      local="en";
    }
  }

  Future<void> loadTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? newTheme = sharedPreferences!.getString("theme");
    if (newTheme == null) {
      mode = ThemeMode.system;
    } else if (newTheme == "light") {
      mode = ThemeMode.light;
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
