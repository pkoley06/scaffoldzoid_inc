import 'package:flutter/material.dart';
import 'package:scaffoldzoid_inc/utils/widget/navigator.dart';

class BuyerHome extends StatefulWidget {
  const BuyerHome({super.key});

  @override
  State<BuyerHome> createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  navigatorScreenPop(context);
                },
                child: const Text("Sign out"))
          ],
        ),
      ),
    );
  }
}
