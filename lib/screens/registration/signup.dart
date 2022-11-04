import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/buyer_home.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/seller_home.dart';
import 'package:scaffoldzoid_inc/screens/dashboard/seller_profile.dart';
import 'package:scaffoldzoid_inc/service/auth_service.dart';
import 'package:scaffoldzoid_inc/utils/widget/navigator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();

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
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              //Email Field
              Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 70, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          label: const Text("Email"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //password field
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          label: Text("Password"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50))),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // confirm password field
                    TextFormField(
                      controller: confirmPasswordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          label: const Text("Confirm password"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ],
                ),
              ),

              // Seller Login
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () async {
                    final User? result = await AuthService().registerUser(
                        emailController.text, passwordController.text, context);
                    if (result != null) {
                      navigatorScreenRemove(
                          context,
                          SellerProfile(
                            user: result,
                          ));
                    }
                  },
                  child: const Text(
                    "Seller Signup",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // buyer login
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () async {
                    final result = await AuthService().registerUser(
                        emailController.text, passwordController.text, context);
                    print(result);
                    if (result != null) {
                      navigatorScreenRemove(context, BuyerHome());
                    }
                  },
                  child: const Text(
                    "Buyer Signup",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Don't have an account? "),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
