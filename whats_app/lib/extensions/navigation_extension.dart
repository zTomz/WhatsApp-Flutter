import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  void pop() => navigator.pop();
  void push(Widget page) => navigator.push(MaterialPageRoute(builder: (context) => page));
}
