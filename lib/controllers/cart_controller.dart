import 'package:get/get.dart';
import 'package:getx/models/product.dart';

class CartController extends GetxController {
  var cart = <Product>[].obs;

  addToCart(Product p) {
    cart.add(p);
  }

  removeFromCart(Product p) {
    cart.remove(p);
  }

  double sum() {
    double total = 0.0;
    var doubleList = cart.map((element) => element.price!.toDouble()).toList();
    doubleList.forEach((element) {
      total += element;
    });
    return total;
  }
}
