import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons(
      {Key? key,
      required this.primary,
      required this.text,
      required this.email,
      required this.password})
      : super(key: key);
  final Color primary;
  final String text;
  final String email;
  final String password;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 150,
          vertical: 15,
        ),
        primary: primary,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
      ),
      onPressed: (() async {
        context
            .read<LoginProvider>()
            .onTabLoginFunction(context, email, password);
      }),
      child: Text(
        text,
      ),
    );
  }
}
