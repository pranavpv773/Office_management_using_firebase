import 'package:flutter/material.dart';
import 'package:user_management_app/home/view/home_page.dart';

class RoutesProvider {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static nextScreen({required var screen}) {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static removeScreen({required var screen}) {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static removeScreenUntil({required var screen}) {
    navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (route) => false);
  }

  static backScreen() {
    navigatorKey.currentState?.pop();
  }
}
