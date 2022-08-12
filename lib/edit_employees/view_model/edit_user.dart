// // ignore_for_file: use_build_context_synchronously

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:user_management_app/login/view/login_screen.dart';
// import 'package:user_management_app/sign_up/model/signup_model.dart';

// class EditUserProvider with ChangeNotifier {
//   final editUserKey = GlobalKey<FormState>();
//   final authEdit = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedUserModel = UserModel();
  
//   final positon = TextEditingController();
//   validation(String value) {
//     const error = "password not matching";
//     if (value.length > 6 && password.text != value) {
//       return error;
//     }
//   }

//   getDataFromCloudForEdit() async {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       loggedUserModel = UserModel.fromMap(value.data()!);
//       notifyListeners();
//     });
//   }

//   Future<void> logOut(BuildContext context) async {
//     await authEdit.signOut();
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => const LoginScreen()));
//   }
// }
