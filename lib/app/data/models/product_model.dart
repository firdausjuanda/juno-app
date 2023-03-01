// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

class Products {
  Products({
    @required this.meta,
    @required this.data,
  });

  final Meta? meta;
  final List<Datum>? data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    @required this.id,
    @required this.categoryId,
    @required this.name,
    @required this.brand,
    @required this.price,
    @required this.uom,
    @required this.model,
    @required this.img,
    @required this.deletedAt,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.category,
  });

  final int? id;
  final int? categoryId;
  final String? name;
  final String? brand;
  final String? price;
  final String? uom;
  final dynamic model;
  final dynamic img;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Category? category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        brand: json["brand"],
        price: json["price"],
        uom: json["uom"],
        model: json["model"],
        img: json["img"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
      );
}

class Category {
  Category({
    @required this.id,
    @required this.name,
    @required this.active,
    @required this.deletedAt,
    @required this.createdAt,
    @required this.updatedAt,
  });

  final int? id;
  final String? name;
  final int? active;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Meta {
  Meta({
    @required this.code,
    @required this.message,
  });

  final String? code;
  final String? message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        message: json["message"],
      );
}
