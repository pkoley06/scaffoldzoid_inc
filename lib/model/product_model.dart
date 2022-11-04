import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String? productName;
  String? productCount;
  String? productPrice;
  String? sellerId;
  ProductModel({
    required this.productName,
    required this.productCount,
    required this.productPrice,
    required this.sellerId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'productCount': productCount,
      'productPrice': productPrice,
      'sellerId': sellerId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      productCount:
          map['productCount'] != null ? map['productCount'] as String : null,
      productPrice:
          map['productPrice'] != null ? map['productPrice'] as String : null,
      sellerId: map['sellerId'] != null ? map['sellerId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
