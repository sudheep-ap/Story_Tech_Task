import 'package:flutter/material.dart';

// To show snackBar

void showSnackBar(context, message, clr) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: clr,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.symmetric(vertical: 15),
    content: Text(message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white)),
    duration: const Duration(seconds: 3),
  ));
}
