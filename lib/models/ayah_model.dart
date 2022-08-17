class AyahModel{
  int? number;
  String? text;
  int? numberInSurah;
  bool selected = false;

  AyahModel({this.number, this.text, this.numberInSurah, this.selected = false});

  static AyahModel fromJson (Map<String, dynamic> json){
    return AyahModel(
      number: json['number'],
      text: json['text'],
      numberInSurah: json['numberInSurah'],
    );
  }

  static List<AyahModel> listFromJson(Map<String, dynamic> json){
    List<dynamic> ayahJson = json['data']['ayahs'];
    List<AyahModel> ayah = [];

    for (var element in ayahJson) {
      ayah.add(fromJson(element));
    }

    return ayah;
  }


}