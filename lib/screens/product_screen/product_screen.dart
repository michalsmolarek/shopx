import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/fav_controller.dart';
import 'package:getx/models/product.dart';
import 'package:getx/screens/home_page/custom_app_bar.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favController = Get.put(FavController());
    var cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            icon: Obx(
                              () => Icon(
                                Icons.favorite,
                                size: 20,
                                color: favController.favList.contains(product)
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Stack(
                            children: [
                              Hero(
                                tag: product.id!,
                                child: FittedBox(
                                  child: CachedNetworkImage(
                                    imageUrl: product.image!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Category: ${product.category!}"),
                        Obx(
                          () => ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: cartController.cart.contains(product)
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: cartController.cart.contains(product)
                                    ? BorderSide(
                                        width: 1,
                                        color: Theme.of(context).primaryColor)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
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
                            label: Text(
                              cartController.cart.contains(product)
                                  ? "Remove from cart"
                                  : "Add to cart",
                              style: TextStyle(
                                fontSize: 12,
                                color: cartController.cart.contains(product)
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                              ),
                            ),
                            icon: Icon(
                              cartController.cart.contains(product)
                                  ? Icons.remove_shopping_cart_outlined
                                  : Icons.add_shopping_cart_outlined,
                              size: 15,
                              color: cartController.cart.contains(product)
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 40,
                      color: Colors.grey[400],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            product.title!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
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
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 40,
                      color: Colors.grey[400],
                    ),
                    Text(product.description!),
                  ],
                ),
              ),
            ],
          ),
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) =>
                  [CustomAppBar(title: "")],
        ),
      ),
    );
  }
}
