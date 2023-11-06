// To parse this JSON data, do
//
//     final categoryItemsModel = categoryItemsModelFromJson(jsonString);

import 'dart:convert';

CategoryItemsModel categoryItemsModelFromJson(String str) =>
    CategoryItemsModel.fromJson(json.decode(str));

String categoryItemsModelToJson(CategoryItemsModel data) =>
    json.encode(data.toJson());

class CategoryItemsModel {
  String categroyImage;
  List<Item> items;

  CategoryItemsModel({
    required this.categroyImage,
    required this.items,
  });

  factory CategoryItemsModel.fromJson(Map<String, dynamic> json) =>
      CategoryItemsModel(
        categroyImage: json["categroy_image"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categroy_image": categroyImage,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String image;
  String title;

  Item({
    required this.image,
    required this.title,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        image: json["image"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
      };
}
