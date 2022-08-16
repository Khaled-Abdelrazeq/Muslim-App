class SurahModel{
  int? number;
  String? name;
  int? numberOfAyahs;
  String? revelationType;
  List<int>? pages = [];

  SurahModel({this.number, this.name, this.revelationType, this.numberOfAyahs, this.pages});

  static SurahModel fromJson (Map<String, dynamic> json){
    if(json == null) return SurahModel();

    List<int> pages = [];
    json['pages'].forEach((element){
      pages.add(element);
    });
    return SurahModel(
      number: json['id'],
      name: json['name_arabic'],
      numberOfAyahs: json['verses_count'],
      revelationType: json['revelation_place'],
      pages: pages,
    );
  }

  static List<SurahModel> listFromJson(Map<String, dynamic> json){
    List<dynamic> surahsJson = json['chapters'];
    List<SurahModel> surahs = [];

    surahsJson.forEach((element) {
      surahs.add(fromJson(element));
    });

    return surahs;
  }


}