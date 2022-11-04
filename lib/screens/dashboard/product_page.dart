import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/model/product_model.dart';

class ProductScreen extends StatelessWidget {
  final User user;
  ProductScreen(this.user, {super.key});

  final FirebaseFirestore firebasseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('product')
              .where('userId', isEqualTo: user.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.docs.length > 0) {
                return ListView.builder(
                  itemCount: snapshot.data.doc.length,
                  itemBuilder: (context, index) {
                    ProductModel productModel =
                        ProductModel.fromJson(snapshot.data.docs[index]);
                    return Card(
                      color: Colors.purple,
                      elevation: 5,
                      margin: EdgeInsets.all(20),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        title: Text(
                          productModel.productName.toString().toUpperCase(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(productModel.productPrice.toString()),
                      ),
                    );
                  },
                );
              }
            }
            return const Center(child: Text('No notes !'));
          },
        ));
  }
}
