import 'package:getx/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static String url = "https://fakestoreapi.com/products";
  static var client = http.Client();

  static Future<List<Product>> getProducts() async {
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return [];
    }
  }
}
