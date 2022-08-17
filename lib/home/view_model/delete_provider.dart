import 'package:flutter/material.dart';

class AlertLogoutBox with ChangeNotifier {
  showLogoutBox(BuildContext context, Widget widget) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return widget;
      },
    );
  }
}
