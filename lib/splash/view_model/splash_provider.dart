// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:user_management_app/login/view/login_screen.dart';

class SplashProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return const LoginScreen();
        },
      ),
    );
  }
}
