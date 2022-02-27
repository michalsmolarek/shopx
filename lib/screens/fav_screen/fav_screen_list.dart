import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/fav_controller.dart';
import 'package:getx/controllers/product_controller.dart';
import 'package:getx/models/product.dart';
import 'package:getx/screens/home_page/product_tile.dart';

class FavScreenList extends StatelessWidget {
  const FavScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favController = Get.put(FavController());

    return Container(
      color: Colors.grey[50],
      child: Obx(() {
        if (favController.favList.isEmpty) {
          return Center(
            child: Text("No Favs"),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            Product product = favController.favList[index];
            return ProductTile(product: product);
          },
          itemCount: favController.favList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width ~/ 180,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        );
      }),
    );
  }
}
