import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/sign_up/view/sign_up.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        RoutesProvider.nextScreen(
          screen: const SignUpScreen(),
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
