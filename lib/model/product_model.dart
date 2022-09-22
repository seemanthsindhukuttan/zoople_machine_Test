import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.data = const [],
  });

  List<Datum> data;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.description,
  });

  int id;
  String name;
  String brand;
  String image;
  String price;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "image": image,
        "price": price,
        "description": description,
      };
}
