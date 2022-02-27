import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product.dart';
import '../product_screen/product_screen.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({
    Key? key,
    required this.p,
    required this.cartController,
  }) : super(key: key);

  final Product p;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => ProductScreen(product: p));
      },
      title: ReadMoreText(
        p.title!,
        trimLines: 2,
        trimCollapsedText: "show more",
        trimExpandedText: "show less",
        style: TextStyle(color: Colors.black, fontSize: 14),
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        moreStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      ),
      subtitle: Text(p.category!),
      leading: Hero(
        tag: p.id!,
        child: CachedNetworkImage(
          imageUrl: p.image!,
          width: 30,
          fit: BoxFit.contain,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
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
              "${p.price!.toStringAsFixed(2)} \$",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 12),
            ),
          ),
          IconButton(
            constraints: BoxConstraints(),
            padding: EdgeInsets.only(left: 5),
            onPressed: () {
              cartController.removeFromCart(p);
            },
            icon: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
