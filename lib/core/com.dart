import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastFlutter({
  required String msg,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );