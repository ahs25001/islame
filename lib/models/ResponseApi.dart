class RadioModel {
  RadioModel({
      this.radios,});

  RadioModel.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(RadioData.fromJson(v));
      });
    }
  }
  List<RadioData>? radios;



}

class RadioData {
  RadioData({
      this.id,
      this.name,
      this.url,
      this.recentDate,});

  RadioData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }
  int? id;
  String? name;
  String? url;
  String? recentDate;



}