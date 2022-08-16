class AyahModel{
  int? number;
  String? text;
  int? numberInSurah;
  bool selected = false;

  AyahModel({this.number, this.text, this.numberInSurah, this.selected = false});

  static AyahModel fromJson (Map<String, dynamic> json){
    if(json == null) return AyahModel();

    return AyahModel(
      number: json['number'],
      text: json['text'],
      numberInSurah: json['numberInSurah'],
    );
  }

  static List<AyahModel> listFromJson(Map<String, dynamic> json){
    List<dynamic> ayasJson = json['data']['ayahs'];
    List<AyahModel> ayas = [];

    ayasJson.forEach((element) {
      ayas.add(fromJson(element));
    });

    return ayas;
  }


}