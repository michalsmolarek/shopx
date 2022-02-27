import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/fav_controller.dart';
import 'package:getx/screens/cart_screen/cart_screen.dart';
import 'package:getx/screens/fav_screen/fav_screen.dart';

import '../../controllers/intro_controller.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var introController = Get.put(IntroController());
    var favController = Get.put(FavController());
    var cartController = Get.put(CartController());
    var verticalPadding = const EdgeInsets.symmetric(horizontal: 4);

    return SliverAppBar(
      floating: true,
      snap: true,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              IconButton(
                constraints: const BoxConstraints(),
                padding: verticalPadding,
                onPressed: () {
                  Get.to(() => const FavScreen());
                },
                icon: Icon(
                  Icons.favorite,
                  color: ModalRoute.of(context)?.settings.name == "/FavScreen"
                      ? Colors.red
                      : Colors.black,
                  size: 15,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                padding: const EdgeInsets.all(3),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Obx(() => Text(
                      "${favController.favList.length}",
                      style: const TextStyle(
                        fontSize: 7,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              IconButton(
                constraints: const BoxConstraints(),
                padding: verticalPadding,
                onPressed: () {
                  Get.to(() => CartScreen());
                },
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: ModalRoute.of(context)?.settings.name == "/CartScreen"
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                  size: 15,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                padding: const EdgeInsets.all(3),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Obx(
                  () => Text(
                    "${cartController.cart.length}",
                    style: const TextStyle(
                      fontSize: 7,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          padding: verticalPadding,
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: Icon(
            Icons.person,
            size: 15,
            color: ModalRoute.of(context)?.settings.name == "/ProfileScreen"
                ? Theme.of(context).primaryColor
                : Colors.black,
          ),
        ),
        IconButton(
          padding: verticalPadding,
          constraints: const BoxConstraints(),
          onPressed: () {
            introController.setOnDoneFalse();
            Get.back();
          },
          icon: const Icon(
            Icons.input_rounded,
            size: 15,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
      title: Text(title),
    );
  }
}
