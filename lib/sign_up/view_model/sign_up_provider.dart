// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';
import 'package:user_management_app/sign_up/view/utilities/utilities.dart';

class SignUpProvider with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final authSign = FirebaseAuth.instance;
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final positon = TextEditingController();
  UserModel userModel = UserModel();

  void signUp(
    BuildContext context,
    String email,
    String password,
    String name,
    String phone,
    String confirmPass,
  ) async {
    if (signUpKey.currentState!.validate()) {
      if (password != confirmPass) {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            iconPositionLeft: 0,
            iconPositionTop: 0,
            iconRotationAngle: 0,
            icon: Icon(
              Icons.abc,
              color: kSwhite,
            ),
            message: "password not matching",
          ),
        );
      } else {
        try {
          await authSign
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) => {podtDetailsToFirebase(context)});
        } on FirebaseAuthException catch (ex) {
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              iconPositionLeft: 0,
              iconPositionTop: 0,
              iconRotationAngle: 0,
              icon: Icon(
                Icons.abc,
                color: kSwhite,
              ),
              message: ex.message.toString(),
            ),
          );
        }
      }
    }
  }

  void podtDetailsToFirebase(BuildContext context) async {
    // calling our fireStore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = authSign.currentUser;

    //calling our userModel

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = userName.text;
    userModel.phone = phoneNumber.text;
    userModel.image = imgstring;

    await firebaseFirestore.collection('users').doc(user.uid).set(
          userModel.toMap(),
        );
    context.read<LoginProvider>().loggedUserModelH = userModel;
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        iconPositionLeft: 0,
        iconPositionTop: 0,
        iconRotationAngle: 0,
        icon: Icon(
          Icons.abc,
          color: kSwhite,
        ),
        backgroundColor: Colors.black,
        message: "successfully added",
      ),
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => UserHomeScreen(),
        ),
        (route) => false);
    //sending details to fireStore
  }

  File? imagefile;
  String imgstring = '';
  changeImage(String imgstring) {
    this.imgstring = imgstring;
    notifyListeners();
  }
}
