import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/product_controller.dart';
import 'package:getx/models/product.dart';
import 'package:getx/screens/home_page/product_tile.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productController = Get.put(ProductController());

    return Container(
      color: Colors.grey[50],
      child: Obx(() {
        if (productController.productList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            Product product = productController.productList[index];
            return ProductTile(product: product);
          },
          itemCount: productController.productList.length,
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
