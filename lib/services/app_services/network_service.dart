import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:muslim_task/shared/network/constants.dart';

class NetworkService extends GetxService{
  static late Dio surahsDio;
  static late Dio dio;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  static void init() {
    surahsDio = Dio(
        BaseOptions(
            baseUrl: NetworkConstants.ALL_SURAHS_BASE_URL,
            receiveDataWhenStatusError: true,
            headers: {
              'Content-Type': 'application/json',
            }
        ));
        dio = Dio(
        BaseOptions(
            baseUrl: NetworkConstants.BASE_URL,
            receiveDataWhenStatusError: true,
            headers: {
              'Content-Type': 'application/json',
            }
        )
    );
  }

  Future<Response> getAllSurahs({
    required String path, Map<String, dynamic>? query, Map<String,
        dynamic>? header
  }) async {
    surahsDio.options.headers = header;
    return await surahsDio.get(path, queryParameters: query);
  }

  Future<Response> getData({
    required String path, Map<String, dynamic>? query, Map<String,
        dynamic>? header
  }) async {
    dio.options.headers = header;
    return await dio.get(path, queryParameters: query);
  }

  Future<Response> postData({
    required String path, Map<String, dynamic>? data, Map<String,
        dynamic>? header, Map<String, dynamic>? query, String? token,
  }) async {
    return await dio.post(path, data: data, queryParameters: query, options: Options(headers: header));
  }
}