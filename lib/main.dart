import 'package:dating_app/app/utils/mediaQueryHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryHelper.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      title: 'Dating App',
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
