// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.rating,
    this.stock,
    this.image,
  });

  int id;
  String name;
  String description;
  String category;
  int price;
  double rating;
  int stock;
  String image;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["Name"],
        description: json["Description"],
        category: json["Category"],
        price: json["Price"],
        rating: json["Rating"].toDouble(),
        stock: json["Stock"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Description": description,
        "Category": category,
        "Price": price,
        "Rating": rating,
        "Stock": stock,
        "Image": image,
      };
}
