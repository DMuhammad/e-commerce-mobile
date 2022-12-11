import 'package:http/http.dart';
import 'package:uas_mobile/model/detailProduct.dart';

Future<DetailProduk> fetchDetailProduct(int id) async {
  DetailProduk dataproduct;

  Response response =
      await get(Uri.parse('https://dummyjson.com/products/:$id'));

  if (response.statusCode == 200) {
    final product = produkFromJson(response.body);
    dataproduct = DetailProduk.fromJson(product.toJson());
    return dataproduct;
  } else {
    throw Exception("Failed to load data product");
  }
}
