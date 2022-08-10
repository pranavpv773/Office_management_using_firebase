import 'package:flutter/material.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/sign_up/view/sign_up.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) {
              return const SignUpScreen();
            },
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          color: appBarBackground,
          fontSize: 15,
        ),
      ),
    );
  }
}
