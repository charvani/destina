// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

import 'product_categoryitem_model.dart';

ProductDetails productDetailsFromJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  List<ProductImage> productImages;
  List<Video> videos;
  List<dynamic> endorsements;
  List<Tab> tabs;
  List<Tabcontent> tabcontent;
  String msg;
  String message;
  bool available;
  int pkid;
  String pcode;
  String name;
  String url;
  String category;
  String description;
  String currency;
  String price;
  String downloadpdf;
  String pType;
  String howtoUse;
  String videoUrl;
  String cv;
  List<ProductCategoryItem> similarProducts;

  ProductDetails(
      {required this.productImages,
      required this.videos,
      required this.endorsements,
      required this.tabs,
      required this.tabcontent,
      required this.msg,
      required this.message,
      required this.available,
      required this.pkid,
      required this.pcode,
      required this.name,
      required this.url,
      required this.category,
      required this.description,
      required this.currency,
      required this.price,
      required this.downloadpdf,
      required this.pType,
      required this.howtoUse,
      required this.videoUrl,
      required this.cv,
      required this.similarProducts});

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        productImages: List<ProductImage>.from(
            json["productImages"].map((x) => ProductImage.fromJson(x))),
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        endorsements: List<dynamic>.from(json["endorsements"].map((x) => x)),
        tabs: List<Tab>.from(json["tabs"].map((x) => Tab.fromJson(x))),
        tabcontent: List<Tabcontent>.from(
            json["tabcontent"].map((x) => Tabcontent.fromJson(x))),
        similarProducts: List<ProductCategoryItem>.from(
            json['productRpt'].map((x) => ProductCategoryItem.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        available: json["available"],
        pkid: json["pkid"],
        pcode: json["pcode"],
        name: json["name"],
        url: json["url"],
        category: json["category"],
        description: json["description"],
        currency: json["currency"],
        price: json["price"],
        downloadpdf: json["downloadpdf"],
        pType: json["pType"],
        howtoUse: json["HowtoUse"],
        videoUrl: json["VideoUrl"],
        cv: json["cv"],
      );

  Map<String, dynamic> toJson() => {
        "productImages":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
        "endorsements": List<dynamic>.from(endorsements.map((x) => x)),
        "tabs": List<dynamic>.from(tabs.map((x) => x.toJson())),
        "tabcontent": List<dynamic>.from(tabcontent.map((x) => x.toJson())),
        "productRpt":
            List<dynamic>.from(similarProducts.map((e) => e.toJson())),
        "Msg": msg,
        "Message": message,
        "available": available,
        "pkid": pkid,
        "pcode": pcode,
        "name": name,
        "url": url,
        "category": category,
        "description": description,
        "currency": currency,
        "price": price,
        "downloadpdf": downloadpdf,
        "pType": pType,
        "HowtoUse": howtoUse,
        "VideoUrl": videoUrl,
        "cv": cv
      };
}

class ProductImage {
  String sno;
  String url;
  String status;

  ProductImage({
    required this.sno,
    required this.url,
    required this.status,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        sno: json["sno"],
        url: json["url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "sno": sno,
        "url": url,
        "status": status,
      };
}

class Tabcontent {
  dynamic title;
  dynamic content;

  Tabcontent({
    required this.title,
    required this.content,
  });

  factory Tabcontent.fromJson(Map<String, dynamic> json) => Tabcontent(
        title: json["Title"],
        content: json["Content"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Content": content,
      };
}

class Tab {
  String title;

  Tab({
    required this.title,
  });

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
        title: json["Title"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
      };
}

class Video {
  String videoUrl;
  String youtubeUrlId;

  Video({
    required this.videoUrl,
    required this.youtubeUrlId,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        videoUrl: json["videoUrl"],
        youtubeUrlId: json["YoutubeUrlID"],
      );

  Map<String, dynamic> toJson() => {
        "videoUrl": videoUrl,
        "YoutubeUrlID": youtubeUrlId,
      };
}
