// To parse this JSON data, do
//
//     final myOrderList = myOrderListFromJson(jsonString);

import 'dart:convert';

List<MyOrderList> myOrderListFromJson(String str) => List<MyOrderList>.from(json.decode(str).map((x) => MyOrderList.fromJson(x)));

String myOrderListToJson(List<MyOrderList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrderList {
  int? orderId;
  String? status;
  int? itemsqty;
  String? eta;
  String? image;

  MyOrderList({
    this.orderId,
    this.status,
    this.itemsqty,
    this.eta,
    this.image,
  });

  factory MyOrderList.fromJson(Map<String, dynamic> json) => MyOrderList(
    orderId: json["orderId"],
    status: json["status"],
    itemsqty: json["itemsqty"],
    eta: json["ETA"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "status": status,
    "itemsqty": itemsqty,
    "ETA": eta,
    "image": image,
  };
}
