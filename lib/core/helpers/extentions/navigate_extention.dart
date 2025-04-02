import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> push<T extends Object>(Widget page) {
    return Navigator.push<T>(
        this, MaterialPageRoute(builder: (context) => page));
  }

  Future<T?> pushNamed<T extends Object>(String routeName,
      {Object? arguments}) {
    return Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  Future<T?> pushReplacement<T extends Object, TO extends Object>(
      Widget newRoute) {
    return Navigator.pushReplacement<T, TO>(
        this, MaterialPageRoute(builder: (context) => newRoute));
  }

  void pop<T extends Object>([T? result]) {
    Navigator.pop<T>(this, result);
  }

  void pushAndRemoveUntil(Widget page) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }
}
