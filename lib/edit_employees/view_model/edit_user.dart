// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management_app/login/view/login_screen.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';

class EditUserProvider with ChangeNotifier {
  final editUserKey = GlobalKey<FormState>();
  final authEdit = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUserModel = UserModel();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final positon = TextEditingController();
  validation(String value) {
    const error = "password not matching";
    if (value.length > 6 && password.text != value) {
      return error;
    }
  }

  getDataFromCloud() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedUserModel = UserModel.fromMap(value.data()!);
      notifyListeners();
    });
  }

  Future<void> logOut(BuildContext context) async {
    await authEdit.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  // void signUp(BuildContext context, String email, String password) async {
  //   if (editUserKey.currentState!.validate()) {
  //     await authSign
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) => {podtDetailsToFirebase(context)});
  //   }
  // }

  // void podtDetailsToFirebase(BuildContext context) async {
  //   // calling our fireStore
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = authSign.currentUser;

  //   //calling our userModel
  //   UserModel userModel = UserModel();

  //   userModel.email = user!.email;
  //   userModel.uid = user.uid;
  //   userModel.username = userName.text;
  //   userModel.phone = phoneNumber.text;

  //   await firebaseFirestore
  //       .collection('users')
  //       .doc(user.uid)
  //       .set(userModel.toMap());
  //   showTopSnackBar(
  //     context,
  //     CustomSnackBar.success(
  //       iconPositionLeft: 0,
  //       iconPositionTop: 0,
  //       iconRotationAngle: 0,
  //       icon: Icon(
  //         Icons.abc,
  //         color: kwhite,
  //       ),
  //       backgroundColor: Colors.black,
  //       message: "successfully added",
  //     ),
  //   );
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => UserHomeScreen(),
  //       ),
  //       (route) => false);
  //   //sending details to fireStore
  // }
}
