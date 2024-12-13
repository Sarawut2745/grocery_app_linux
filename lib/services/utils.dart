import 'package:flutter/material.dart';

class Utils {
  final BuildContext context;

  Utils(this.context);

  bool get getTheme {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Size get getScreenSize {
    return MediaQuery.of(context).size;
  }
}
