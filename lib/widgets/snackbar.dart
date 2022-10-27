import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          message,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        )));
  }
}
