import 'dart:convert';
import 'package:uas_mobile/model/products.dart';

DetailProduk produkFromJson(String str) =>
    DetailProduk.fromJson(json.decode(str));
String produkToJson(DetailProduk data) => json.encode(data.toJson());

class DetailProduk {
  DetailProduk({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  factory DetailProduk.fromJson(Map<String, dynamic> json) => DetailProduk(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"],
        rating: json["rating"],
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<String>.from(images.map((x) => x)),
      };
}
