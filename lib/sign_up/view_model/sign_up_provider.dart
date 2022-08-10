import 'package:flutter/widgets.dart';

class SignUpProvider with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final positon = TextEditingController();
}
