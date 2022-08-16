import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/profile_updation/view_model/profileupt_provider.dart';
import 'package:user_management_app/utilities/view/const.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key,
    required this.primary,
    required this.text,
    required this.department,
    required this.email,
    required this.employ,
    required this.phone,
    required this.salary,
    required this.uid,
    this.function,
  }) : super(key: key);
  final Color primary;
  final String text;
  final TextEditingController email;
  final TextEditingController department;
  final TextEditingController employ;
  final TextEditingController phone;
  final TextEditingController salary;
  final String uid;

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
          context.read<UpdateProfileProvider>().updateEmploy(
                image: tempImage,
                email: email.text,
                employ: employ.text,
                department: department.text,
                context: context,
                phone: phone.text,
                salary: salary.text,
                uid: uid,
              );
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
