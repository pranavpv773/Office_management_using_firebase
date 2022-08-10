import 'package:flutter/material.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';

class SignUpTextforms extends StatelessWidget {
  const SignUpTextforms(
      {Key? key,
      required this.icon,
      required this.text,
      required this.obscureText,
      required this.vertical,
      required this.controller})
      : super(key: key);
  final IconData icon;
  final String text;
  final bool obscureText;
  final double vertical;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: vertical,
        right: 40,
        left: 40,
      ),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: controller,
            style: TextStyle(
              color: kGrey,
              fontSize: 18,
            ),
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: kwhite,
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  color: appBarBackground,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: kwhite,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
              border: const OutlineInputBorder(),
              hintText: text,
              hintStyle: TextStyle(
                fontSize: 15,
                color: kGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
