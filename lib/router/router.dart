import 'package:get/route_manager.dart';
import 'package:muslim_task/modules/details/details_page.dart';
import 'package:muslim_task/modules/home/home_page.dart';
import 'package:muslim_task/router/router_constants.dart';

class AppRouter {
  static final routes = [
     GetPage(
      name: RoutesConstants.homePage,
      page: () => HomePage(),
    ),

     GetPage(
      name: RoutesConstants.detailsPage,
      page: () => DetailsPage(),
    ),

  ];
}
