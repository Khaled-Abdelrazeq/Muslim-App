import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:muslim_task/models/ayah_model.dart';
import 'package:muslim_task/services/app_services/network_service.dart';
import 'package:muslim_task/shared/network/end_points.dart';

class QuranPageService extends getx.GetxService{
  final NetworkService _networkService = getx.Get.find<NetworkService>();

  Future<List<AyahModel>> fetchQuranPage(int pageIndex) async{
    try{
      Response response = await _networkService.getData(path: '${EndPoints.getPage1}$pageIndex/${EndPoints.getPage2}');
      return AyahModel.listFromJson(response.data);
    }on DioError catch(error){
      throw Exception('Fetch Quran Page error ${error.message}');
    }
  }
}