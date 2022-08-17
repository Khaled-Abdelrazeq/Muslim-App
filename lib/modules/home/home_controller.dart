import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_task/models/surah_model.dart';
import 'package:muslim_task/router/router_constants.dart';
import 'package:muslim_task/services/api_services/quran_surahs_services.dart';
import 'package:muslim_task/services/app_services/shared_preferences_service.dart';

class HomeController extends GetxController{
  final QuranSurahsService _quranSurahsService = Get.put(QuranSurahsService());
  final SharedPreferencesService _sharedPreferencesService = Get.put(SharedPreferencesService());

  List<SurahModel> surahs = [];
  List<String> ayahs = [];

  TextEditingController searchController = TextEditingController();
  Set<String>? setOfKeys;

  @override
  void onInit() {
    super.onInit();
    fetchQuranSurahs();
    getSavedAyahs();
  }

  void getSavedAyahs()async{
    setOfKeys = await _sharedPreferencesService.getKeys();
    ayahs = [];
    setOfKeys?.forEach((e) async{
      ayahs.add('${await _sharedPreferencesService.getValueWithKey(e)}');
    });
    update();
  }

  void deleteSavedAya(int index){
    _sharedPreferencesService.removeValueWithKey(setOfKeys?.toList()[index]??'');
    getSavedAyahs();
  }

  void fetchQuranSurahs() async{
    try{
      surahs = await _quranSurahsService.fetchQuranSurahs();
    }catch(error){
      if(kDebugMode) debugPrint('Fetch Quran Surahs Error $error');
    }
    update();
  }

  void onSurahTap(int index){
    Get.toNamed(RoutesConstants.detailsPage, arguments: [surahs[index].pages?[0], surahs[index].name])?.then((value) {
      getSavedAyahs();
    });
  }

}