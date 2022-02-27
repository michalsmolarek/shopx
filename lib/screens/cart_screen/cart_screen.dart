import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/models/product.dart';
import 'package:getx/screens/home_page/custom_app_bar.dart';
import 'package:getx/screens/product_screen/product_screen.dart';
import 'package:readmore/readmore.dart';

import 'cart_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            body: CartList(cartController: cartController),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) =>
                    [CustomAppBar(title: "Cart")],
          ),
        ));
  }
}
