import 'package:flutter/material.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
