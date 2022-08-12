import 'package:flutter/material.dart';
import 'package:user_management_app/home/view/widgets/logout_alert.dart';

class AlertLogoutBox with ChangeNotifier {
  showLogoutBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return DeletionAlertBox();
      },
    );
  }
}
