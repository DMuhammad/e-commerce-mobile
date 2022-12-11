import 'package:http/http.dart';
import 'package:uas_mobile/model/products.dart';

Future<List<Product>> fetchProduct() async {
  List<Product> dataproduct;

  Response response = await get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    final product = produkFromJson(response.body);
    Map jsonProduct = product.toJson();
    List listProduct = jsonProduct["products"] as List;
    dataproduct =
        listProduct.map<Product>((json) => Product.fromJson(json)).toList();
    return dataproduct;
  } else {
    throw Exception("Failed to load data product");
  }
}
