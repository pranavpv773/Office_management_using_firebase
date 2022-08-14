import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';
import 'package:user_management_app/utilities/view_model/snack_top.dart';

class LoginProvider with ChangeNotifier {
  final userName = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  UserModel loggedUserModelH = UserModel();
  final password = TextEditingController();
  Stream<User?> stream() => auth.authStateChanges();
  onTabLoginFunction(
      BuildContext context, String emailFn, String passwordFn) async {
    if (formKey.currentState!.validate()) {
      try {
        await auth
            .signInWithEmailAndPassword(email: emailFn, password: passwordFn)
            .then(
              (value) => {
                getDataFromCloud(context),
              },
            );
      } on FirebaseAuthException catch (e) {
        context.read<SnackTProvider>().errorBox(context, e);
      }
    }
  }

  Future<void> logOut(BuildContext context) async {
    await auth.signOut();
  }

  getDataFromCloud(BuildContext context) async {
    User? user = auth.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedUserModelH = UserModel.fromMap(value.data()!);
      notifyListeners();
      email.clear();
      password.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => UserHomeScreen(),
          ),
          (route) => false);
    });
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
