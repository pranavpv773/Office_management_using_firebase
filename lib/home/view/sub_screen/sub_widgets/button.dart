import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/profile/view_model/auth_profile.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    Key? key,
    required this.primary,
    required this.text,
    this.function,
  }) : super(key: key);
  final Color primary;
  final String text;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 120,
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
      onPressed: () {
        try {
          context.read<AuthProfile>().employeeDetailsToFirebase(context);
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.toString()),
          ));
        }
      },
      child: Text(
        text,
      ),
    );
  }
}
