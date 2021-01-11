import 'dart:async';
import 'products_class.dart';
import 'package:http/http.dart' as http;

class Fetcher {
  static String url =
      'https://run.mocky.io/v3/62cb1823-9380-43dd-9c34-a2ebe2535890';
  static Future<List<Products>> getProducts() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Products> product = productsFromJson(response.body);
        return product;
      }
    } catch (e) {
      return List<Products>();
    }
  }
}
