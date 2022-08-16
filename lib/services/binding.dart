import 'package:get/get.dart';
import 'package:muslim_task/modules/details/details_controller.dart';
import 'package:muslim_task/modules/home/home_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DetailsController());
  }
}
