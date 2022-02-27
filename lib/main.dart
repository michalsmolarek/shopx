import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/screens/home_page/my_home_page.dart';
import 'package:getx/screens/intro_screen/intro_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/intro_controller.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var introController = Get.put(IntroController());
    final String fontFamily = GoogleFonts.montserrat().fontFamily!;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopX',
      theme: ThemeData(
        fontFamily: fontFamily,
        primarySwatch: Colors.deepOrange,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 12,
          ),
          bodyText1: TextStyle(
            fontSize: 12,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: Obx(
          () => introController.isDone.value ? MyHomePage() : IntroScreen()),
    );
  }
}
