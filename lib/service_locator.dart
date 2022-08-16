import 'package:get/get.dart';
import 'package:muslim_task/services/api_services/quran_surahs_services.dart';
import 'package:muslim_task/services/app_services/network_service.dart';
import 'package:muslim_task/services/app_services/shared_preferences_service.dart';
import 'package:muslim_task/services/app_services/snackbar_service.dart';

void setupLocator() {
  ///App Services
  Get.lazyPut(() => SharedPreferencesService());
  Get.lazyPut(() => SnackBarService());
  Get.lazyPut(() => NetworkService());

  ///Api Services
  Get.lazyPut(() => QuranSurahsService());
}
