import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key, required this.primary, required this.text})
      : super(key: key);
  final Color primary;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
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
        // checkLogin(context);
      }),
      child: Text(
        text,
      ),
    );
  }
}
