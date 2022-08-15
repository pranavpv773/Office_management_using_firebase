// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';
import 'package:user_management_app/utilities/view_model/snack_top.dart';

class HomeProvider with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final authSign = FirebaseAuth.instance;
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  void signUp(BuildContext context, String email, String password) async {
    if (signUpKey.currentState!.validate()) {
      await authSign
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {podtDetailsToFirebase(context)});
    }
  }

  void podtDetailsToFirebase(BuildContext context) async {
    // calling our fireStore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = authSign.currentUser;

    //calling our userModel
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = userName.text;
    userModel.phone = phoneNumber.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    context.read<SnackTProvider>().successSnack(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => UserHomeScreen(),
        ),
        (route) => false);
    //sending details to fireStore
  }
}
