import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/models/product.dart';
import 'package:getx/services/product_service.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var client = http.Client;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    var products = await ProductService.getProducts();
    if (products.isNotEmpty) {
      productList.value = products;
      // Get.snackbar("Sukces", "Pobrano produkty",
      //     backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      productList.value = [];
      Get.snackbar("Błąd", "Problem przy pobieraniu produktów",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
