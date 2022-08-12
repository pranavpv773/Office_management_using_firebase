import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/login/view/login_screen.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';
import 'package:user_management_app/sign_up/view/sign_up.dart';

class LoginProvider with ChangeNotifier {
  final userName = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  UserModel loggedUserModelH = UserModel();
  final password = TextEditingController();
  onTabLoginFunction(
      BuildContext context, String emailFn, String passwordFn) async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(email: emailFn, password: passwordFn)
          .then(
            (value) => {
              getDataFromCloud(context),
            },
          );
    }
  }

  Future<void> logOut(BuildContext context) async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => UserHomeScreen(),
          ),
          (route) => false);
    });
  }

  onTabGoogleFunction(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return const SignUpScreen();
        },
      ),
    );
  }
}
