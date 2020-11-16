import 'package:asuka/asuka.dart' as asuka;
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'errors.dart';

class Utils {
  static void showSnackBar({Option<Failure> failure, String msg, Color bgColor}) {
    if (failure != null && failure != none()) {
      failure.map((a) {
        msg = a.message;
      });
    }
    if ((failure != null && failure != none()) || msg != null) {
      asuka.showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: bgColor ?? Colors.red,
      ));
    }
  }

  static bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regex = RegExp(pattern);
    var result = (!regex.hasMatch(value)) ? false : true;
    return result;
  }
}
