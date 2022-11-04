import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/screens/registration/signup.dart';
import 'package:scaffoldzoid_inc/service/auth_service.dart';
import 'package:scaffoldzoid_inc/utils/widget/navigator.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({super.key});

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  AuthService().signOut();
                  navigatorScreenRemove(context, SignUpScreen());
                },
                child: const Text("Sign out"))
          ],
        ),
      ),
    );
  }
}
