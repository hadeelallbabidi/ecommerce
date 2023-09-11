import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String image;
  String id;
  bool isFavourite;
  String name;
  double price;
  String description;

  int? qty;

  ProductModel(
      {required this.image,
      required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.isFavourite,
      this.qty});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      description: json["description"],
      price: double.parse(json["price"].toString()),
      isFavourite: false,
      qty: json["qty"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "isFavourite": isFavourite,
        "price": price,
        "qty": qty
      };
  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
          image: image,
          id: id,
          name: name,
          price: price,
          description: description,
          isFavourite: isFavourite,
          qty: qty ?? this.qty
          );
}
