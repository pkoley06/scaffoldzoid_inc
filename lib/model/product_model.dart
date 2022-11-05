import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String productName;
  String sellerName;
  String productPrice;
  String userId;
  ProductModel({
    required this.productName,
    required this.sellerName,
    required this.productPrice,
    required this.userId,
  });

  factory ProductModel.fromJson(DocumentSnapshot snapshot) {
    return ProductModel(
        productName: snapshot['productName'],
        sellerName: snapshot['sellerName'],
        productPrice: snapshot['productPrice'],
        userId: snapshot['userId']);
  }
}
