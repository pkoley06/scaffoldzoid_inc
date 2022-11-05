import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/model/product_model.dart';
import 'package:scaffoldzoid_inc/service/firestore_service.dart';
import 'package:scaffoldzoid_inc/utils/widget/navigator.dart';

class UpdateProduct extends StatefulWidget {
  ProductModel productModel;
  UpdateProduct(this.productModel, {super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController sellerNameController = TextEditingController();

  @override
  void initState() {
    productNameController.text = widget.productModel.productName;
    productPriceController.text = widget.productModel.productPrice;
    sellerNameController.text = widget.productModel.sellerName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: ((BuildContext context) {
                      return AlertDialog(
                        title: const Text("Please Confirm"),
                        content: const Text("Are you sure to delete the note?"),
                        actions: [
                          TextButton(onPressed: () {}, child: const Text("No")),
                          TextButton(
                              onPressed: () async {
                                await FireStoreService()
                                    .deleteProduct(widget.productModel.id);
                                //exit from dialog box
                                Navigator.pop(context);
                                //exit from deleted page
                                Navigator.pop(context);
                              },
                              child: const Text("Yes"))
                        ],
                      );
                    }));
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red[800],
              ))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Update product",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // seller name field
                    const Text(
                      "Seller name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      controller: sellerNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Product name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      height: 20,
                    ),
                    const Text(
                      "Price / kg",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade600,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () async {
                          await FireStoreService().addProduct(
                              sellerNameController.text,
                              productNameController.text,
                              productPriceController.text,
                              widget.productModel.id);
                          navigatorScreenPop(context);
                        },
                        child: const Text(
                          "Update product",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
