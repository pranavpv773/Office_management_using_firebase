// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';
import 'package:user_management_app/utilities/view_model/snack_top.dart';

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
        context.read<SnackTProvider>().errorPassword(context);
      } else {
        try {
          await authSign
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) => {podtDetailsToFirebase(context)});
        } on FirebaseAuthException catch (ex) {
          context.read<SnackTProvider>().errorBox(context, ex);
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

    //sending details to fireStore
    await firebaseFirestore.collection('users').doc(user.uid).set(
          userModel.toMap(),
        );
    context.read<LoginProvider>().loggedUserModelH = userModel;
    disposeControll();
    context.read<SnackTProvider>().successSnack(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => UserHomeScreen(),
        ),
        (route) => false);
  }

  onTabGoogleFunction(BuildContext context) async {
    try {
      final isLogged = await GoogleSignIn().isSignedIn();
      if (isLogged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();

      final cred = await result!.authentication;
      await authSign
          .signInWithCredential(GoogleAuthProvider.credential(
              accessToken: cred.accessToken, idToken: cred.idToken))
          .then(
            (value) => {
              context.read<LoginProvider>().getDataFromCloud(context),
            },
          );
    } on FirebaseAuthException catch (e) {
      context.read<SnackTProvider>().errorBox(context, e);
    }
  }

  disposeControll() {
    userName.clear();
    phoneNumber.clear();
    email.clear();
    confirmPassword.clear();
    password.clear();
  }

  File? imagefile;
  String imgstring = '';
  changeImage(String imgstring) {
    this.imgstring = imgstring;
    notifyListeners();
  }
}
