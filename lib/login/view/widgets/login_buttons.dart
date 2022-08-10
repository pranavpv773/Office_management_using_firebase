import 'package:flutter/material.dart';
import 'package:user_management_app/home/view/home_page.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    Key? key,
    required this.primary,
    required this.text,
  }) : super(key: key);
  final Color primary;
  final String text;
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
      onPressed: (() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) {
              return const UserHomeScreen();
            },
          ),
        );
        // checkLogin(context);
      }),
      child: Text(
        text,
      ),
    );
  }
}
