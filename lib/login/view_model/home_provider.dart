import 'package:flutter/material.dart';
import 'package:user_management_app/sign_up/view/sign_up.dart';

class LoginProvider with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  onTabFunction(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return const SignUpScreen();
        },
      ),
    );
  }
}
