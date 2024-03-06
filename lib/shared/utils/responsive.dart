import 'package:flutter/material.dart';

class Responsive {
  /// Get screen height in percentage
  static double height(context) {
    return MediaQuery.sizeOf(context).height / 100;
  }

  /// Get screen width in percentage
  static double width(context) {
    return MediaQuery.sizeOf(context).width / 100;
  }
}
