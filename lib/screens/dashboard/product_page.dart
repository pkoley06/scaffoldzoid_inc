import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/model/product_model.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/add_product.dart';
import 'package:scaffoldzoid_inc/utils/widget/navigator.dart';

class ProductScreen extends StatelessWidget {
  final User user;
  ProductScreen(this.user, {super.key});

  final FirebaseFirestore firebasseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange.shade800,
          onPressed: () {
            navigatorScreen(
                context,
                AddProduct(
                  user,
                ));
          },
          child: const Icon(
            Icons.add_business,
            color: Colors.white,
          ),
        ),
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
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    ProductModel productModel =
                        ProductModel.fromJson(snapshot.data.docs[index]);
                    return Card(
                      color: Colors.purple,
                      elevation: 5,
                      margin: const EdgeInsets.all(20),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        title: Text(
                          productModel.productName.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                            "${productModel.productPrice + productModel.productCount}",
                            style: TextStyle(color: Colors.white)),
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
