import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";


abstract class BaseScreenState<T extends StatefulWidget> extends State<T> {

  void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.redAccent,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18,
    );
  }

  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
