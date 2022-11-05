import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String productName;
  String productCount;
  String productPrice;
  String userId;
  ProductModel({
    required this.productName,
    required this.productCount,
    required this.productPrice,
    required this.userId,
  });

  factory ProductModel.fromJson(DocumentSnapshot snapshot) {
    return ProductModel(
        productName: snapshot['productName'],
        productCount: snapshot['productCount'],
        productPrice: snapshot['productPrice'],
        userId: snapshot['userId']);
  }
}
