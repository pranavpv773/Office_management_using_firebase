import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/sign_up/view/sign_up.dart';

class LoginProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  onTabLoginFunction(
      BuildContext context, String emailFn, String passwordFn) async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(email: emailFn, password: passwordFn)
          .then(
            (value) => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return UserHomeScreen();
                  },
                ),
              ),
            },
          );
    } else {
      print("object");
    }
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
