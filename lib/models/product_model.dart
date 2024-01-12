
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String detail;
  String? hero;
  String image;
  String name;
  String price;
  String? info;
  String? offer;

  ProductModel({
    required this.detail,
    this.hero,
    required this.image,
    required this.name,
    required this.price,
    this.info,
    this.offer,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    detail: json["detail"],
    hero: json["hero"],
    image: json["image"],
    name: json["name"],
    price: json["price"],
    info: json["info"],
    offer: json["offer"],
  );

  Map<String, dynamic> toJson() => {
    "detail": detail,
    "hero": hero,
    "image": image,
    "name": name,
    "price": price,
    "info": info,
    "offer": offer,
  };
}
