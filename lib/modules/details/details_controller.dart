import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_task/models/ayah_model.dart';
import 'package:muslim_task/services/api_services/quran_page_service.dart';
import 'package:muslim_task/services/app_services/shared_preferences_service.dart';

class DetailsController extends GetxController{
  final QuranPageService _quranSurahsService = Get.put(QuranPageService());
  final SharedPreferencesService _sharedPreferencesService = Get.put(SharedPreferencesService());

  double fontSize = 18;
  List<AyahModel> ayahs = [];
  int pageIndex = 1;
  String? surahTitle;
  List<dynamic> arguments = [];
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments;
    pageIndex = arguments[0];
    surahTitle = arguments[1];
    currentIndex = pageIndex - 1;
    fetchPage();
  }

  void getKeys()async{
    var setOfKeys = await _sharedPreferencesService.getKeys();
    setOfKeys?.forEach((e) {
      if(e.substring(0, e.indexOf('/')) == pageIndex.toString()){
        int index = int.parse(e.substring(e.indexOf('/')).replaceAll('/', ''));
        print(index);
        ayahs[index].selected = true;
      }
    });
    update();
  }

  changeBoardingPage(index) {
    if(currentIndex < index) {
      pageIndex++;
    }else{
      pageIndex--;
    }
    fetchPage();
    currentIndex = index;
    update();
  }

  void fetchPage()async{
    try{
      print(pageIndex);
      ayahs = await _quranSurahsService.fetchQuranPage(pageIndex);
      getKeys();
    }catch(error){
      if(kDebugMode) debugPrint('Fetch Quran Page Error $error');
    }
    update();
  }

  void onBackTap(){
    Get.back();
  }

  void changeFontSize(double fontSize){
    this.fontSize = fontSize;
    update();
  }

  void onAyaSelected(int index){
    print(ayahs[index].text);
    ayahs[index].selected = true;
    _sharedPreferencesService.saveValueWithKey('$pageIndex/$index', '${ayahs[index].text} ﴿${index+1}﴾     $surahTitle');
    update();
  }

}