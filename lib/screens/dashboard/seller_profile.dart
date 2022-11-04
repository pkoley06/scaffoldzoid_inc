import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/product_page.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/seller_home.dart';
import 'package:scaffoldzoid_inc/service/firestore_service.dart';
import 'package:scaffoldzoid_inc/utils/widget/navigator.dart';

class SellerProfile extends StatelessWidget {
  final User user;
  SellerProfile({super.key, required this.user});

  TextEditingController nameController = TextEditingController();

  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),

                // name field
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "About",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),

                // about field
                TextFormField(
                  minLines: 3,
                  maxLines: 10,
                  controller: aboutController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
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
                      if (nameController.text == "" ||
                          aboutController.text == "") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("All fields are required !"),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        await FireStoreService().insertNameAbout(
                            nameController.text,
                            aboutController.text,
                            user.uid);
                        // ignore: use_build_context_synchronously
                        navigatorScreen(context, ProductScreen(user));
                      }
                    },
                    child: const Text(
                      "Next",
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
