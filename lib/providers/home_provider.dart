import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/ResponseApi.dart';

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
  bool isRadioPlay = false;
  int indexOfRadio = 0;
  final player = AudioPlayer();
  List<RadioData> radios = [];
  /// Quran tab
  List<String> view = [];

  void lodFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> aya = sura.trim().split("\n");
    view = aya;
    notifyListeners();
  }
  void playNext() {
    if (indexOfRadio == radios.length-1) {
      indexOfRadio = 0;
    } else {
      indexOfRadio++;
    }
    if (isRadioPlay) {
      player.play(UrlSource(radios[indexOfRadio].url!));
    }
    notifyListeners();
  }

  void playPrevious() {
    if (indexOfRadio == 0) {
      indexOfRadio = radios.length - 1;
    } else {
      indexOfRadio--;
    }
    if (isRadioPlay) {
      player.play(UrlSource(radios[indexOfRadio].url!));
    }
    notifyListeners();
  }

  void playRadio() {
    if (!isRadioPlay) {
      player.play(UrlSource(radios[indexOfRadio].url!));
      isRadioPlay = true;
      notifyListeners();
    }
  }

  void pauseRadio() {
    player.pause();
    isRadioPlay = false;
    notifyListeners();
  }
}