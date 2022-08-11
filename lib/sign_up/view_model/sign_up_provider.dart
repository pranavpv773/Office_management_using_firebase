import 'package:flutter/widgets.dart';

class SignUpProvider with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final positon = TextEditingController();
  validation(String value) {
    const error = "password not matching";
    if (value.length > 6 && password.text != value) {
      return error;
    }
  }

  void signUp(String) {}
}
