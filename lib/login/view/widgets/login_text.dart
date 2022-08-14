import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:user_management_app/sign_up/view/sign_up.dart';
import 'package:user_management_app/utilities/view/const.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          SwipeablePageRoute(
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
