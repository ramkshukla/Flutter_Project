import 'package:flutter/material.dart';

class AppSnackbar {
  static void showSnackbar(
      {required BuildContext context,
      required String message,
      bool isSuccess = false}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
