import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:muslim_task/models/surah_model.dart';
import 'package:muslim_task/services/app_services/network_service.dart';
import 'package:muslim_task/shared/network/end_points.dart';

class QuranSurahsService extends getx.GetxService{
  final NetworkService _networkService = getx.Get.find<NetworkService>();

  Future<List<SurahModel>> fetchQuranSurahs() async{
    try{
      Response response = await _networkService.getAllSurahs(path: EndPoints.getAllSurahs);
      return SurahModel.listFromJson(response.data);
    }on DioError catch(error){
      throw Exception('Fetch QuranSurahs error ${error.message}');
    }
  }
}