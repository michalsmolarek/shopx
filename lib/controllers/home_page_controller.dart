import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var isWhite = true.obs;

  change() {
    isWhite.value = !isWhite.value;
  }
}
