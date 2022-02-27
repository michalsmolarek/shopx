import 'package:get/get.dart';
import 'package:getx/models/product.dart';

class FavController extends GetxController {
  var favList = <Product>[].obs;

  addToFav(Product p) {
    favList.add(p);
  }

  removeFromFav(Product p) {
    favList.remove(p);
  }
}
