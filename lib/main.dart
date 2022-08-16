import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_task/router/router.dart';
import 'package:muslim_task/router/router_constants.dart';
import 'package:muslim_task/service_locator.dart';
import 'package:muslim_task/services/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ArabicFont'),
      initialRoute: RoutesConstants.homePage,
      getPages: AppRouter.routes,
      builder: (context, Widget? child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
    );
  }
}
