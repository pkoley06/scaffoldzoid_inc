import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/service/firestore_service.dart';
import 'package:scaffoldzoid_inc/utils/widget/navigator.dart';

class AddProduct extends StatelessWidget {
  final User user;
  const AddProduct(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController productCountController = TextEditingController();
    TextEditingController productPriceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              navigatorScreenPop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.cyan,
            )),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Product name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Product name field
                TextFormField(
                  controller: productNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "No of product",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Product count field
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: productCountController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Price / product",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Product price field
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: productPriceController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () async {
                      await FireStoreService().addProduct(
                          productNameController.text,
                          productCountController.text,
                          productPriceController.text,
                          user.uid);
                      navigatorScreenPop(context);
                    },
                    child: const Text(
                      "Add product",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
