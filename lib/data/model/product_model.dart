// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int? id;
  String? unit;
  String? title;
  String? image;
  String? productInformation;
  String? uses;
  String? productFeatureAndSpecification;
  String? directionForUse;
  String? safteyInformation;
  Color? bgColor;
  Color? textBGColor;

  Product({
    this.id,
    this.unit,
    this.title,
    this.image,
    this.productInformation,
    this.uses,
    this.productFeatureAndSpecification,
    this.directionForUse,
    this.safteyInformation,
    this.bgColor,
    this.textBGColor,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    unit: json["unit"],
    title: json["title"],
    image: json["image"],
    productInformation: json["productInformation"],
    uses: json["uses"],
    productFeatureAndSpecification: json["productFeatureAndSpecification"],
    directionForUse: json["directionForUse"],
    safteyInformation: json["safetyInformation"],
    bgColor: json["bgColor"],
    textBGColor: json["textBGColor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit": unit,
    "title": title,
    "image": image,
    "productInformation": productInformation,
    "uses": uses,
    "productFeatureAndSpecification": productFeatureAndSpecification,
    "directionForUse": directionForUse,
    "safetyInformation": safteyInformation,
    "textBGColor": textBGColor,
  };
}
