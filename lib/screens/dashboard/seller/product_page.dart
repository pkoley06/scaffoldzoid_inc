import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/model/product_model.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/seller/add_product.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/seller/update_product.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/welcome.dart';
import 'package:scaffoldzoid_inc/service/auth_service.dart';
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
          centerTitle: true,
          title: const Text(
            "Product List",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                color: Colors.black,
                onPressed: () async {
                  // ignore: use_build_context_synchronously

                  showDialog(
                      context: context,
                      builder: ((BuildContext context) {
                        return AlertDialog(
                          title: const Text("Please Confirm"),
                          content: const Text("Are you sure to log out?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No")),
                            TextButton(
                                onPressed: () async {
                                  await AuthService().signOut();
                                  // ignore: use_build_context_synchronously
                                  navigatorScreenRemove(
                                      context, WelcomeScreen());
                                },
                                child: const Text("Yes"))
                          ],
                        );
                      }));
                },
                icon: const Icon(Icons.logout)),
          ],
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
                        onTap: () {
                          navigatorScreen(context, UpdateProduct(productModel));
                        },
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        leading: Text(
                          "\$ ${productModel.productPrice} /kg",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          productModel.productName.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text("Seller - ${productModel.sellerName}",
                            style: TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                );
              }
            }
            return const Center(child: Text('No products !'));
          },
        ));
  }
}
