import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (ctx) {
    //       return;
    //     },
    //   ),
    // );
  }
}
