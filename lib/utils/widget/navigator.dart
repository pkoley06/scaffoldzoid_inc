import 'package:flutter/material.dart';

void navigatorScreen(context, page) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => page,
  ));
}

void navigatorScreenReplace(context, page) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => page,
  ));
}

void navigatorScreenRemove(context, page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false);
}

void navigatorScreenPop(context) {
  Navigator.of(context).pop(context);
}
