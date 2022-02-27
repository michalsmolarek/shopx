import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/fav_controller.dart';
import 'package:getx/models/product.dart';
import 'package:getx/screens/product_screen/product_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favController = Get.put(FavController());
    var cartController = Get.put(CartController());
    return InkWell(
      onTap: () => Get.to(() => ProductScreen(product: product),
          transition: Transition.fadeIn),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black45,
                  spreadRadius: -8,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: product.id!,
                    child: CachedNetworkImage(
                      imageUrl: product.image!,
                      placeholder: (context, str) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(product.title!),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "${product.price!.toStringAsFixed(2)} \$",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: IconButton(
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          var list = cartController.cart;
                          if (list.isNotEmpty) {
                            if (list.contains(product)) {
                              cartController.removeFromCart(product);
                            } else {
                              cartController.addToCart(product);
                            }
                          } else {
                            cartController.addToCart(product);
                          }
                          print(cartController.cart);
                        },
                        icon: Obx(
                          () => Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: cartController.cart.contains(product)
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              cartController.cart.contains(product)
                                  ? Icons.remove_shopping_cart_outlined
                                  : Icons.add_shopping_cart_rounded,
                              size: cartController.cart.contains(product)
                                  ? 13
                                  : 16,
                              color: cartController.cart.contains(product)
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 35,
                width: 40,
                child: IconButton(
                  onPressed: () {
                    var list = favController.favList;
                    if (list.isNotEmpty) {
                      if (list.contains(product)) {
                        favController.removeFromFav(product);
                      } else {
                        favController.addToFav(product);
                      }
                    } else {
                      favController.addToFav(product);
                    }
                    print(favController.favList);
                  },
                  icon: Obx(() => Icon(
                        Icons.favorite,
                        size: 20,
                        color: favController.favList.contains(product)
                            ? Colors.red
                            : Colors.grey,
                      )),
                ),
              ),
              Container(
                height: 25,
                alignment: Alignment.topRight,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 20,
                    ),
                    Text(
                      "${product.rating!.rate}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
