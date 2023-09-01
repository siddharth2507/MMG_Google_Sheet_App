import 'package:flutter/material.dart';

class Snackbar {
  void showSnack({String? message, BuildContext? context}) =>
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Center(
            child: Text(
              message ?? '',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          /*   action: undo != null ? SnackBarAction(
            textColor: Colors.white,
            label: "Undo",
            onPressed: () => undo,
          ):null,*/
        ),
      );
}
