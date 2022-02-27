import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product.dart';
import '../product_screen/product_screen.dart';
import 'cart_list_tile.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.cart.isEmpty) {
        return const Center(
          child: Text('Your cart is empty'),
        );
      }
      return Stack(
        children: [
          ListView.builder(
            itemCount: cartController.cart.length,
            itemBuilder: (context, index) {
              Product p = cartController.cart[index];
              return CartListTile(p: p, cartController: cartController);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  margin: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Total: ${cartController.sum().toStringAsFixed(2)} \$',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  margin: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
