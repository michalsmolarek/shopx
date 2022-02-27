import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/product_controller.dart';
import 'package:getx/screens/home_page/custom_app_bar.dart';
import 'package:getx/screens/home_page/product_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          body: const ProductList(),
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) =>
                  [CustomAppBar(title: "ShopX")],
        ),
      ),
    );
  }
}
