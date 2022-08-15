import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';
import 'package:user_management_app/utilities/view_model/snack_top.dart';

import 'image_services.dart';

class AuthServices with ChangeNotifier {
  UserModel loggedUserModelH = UserModel();
  static FirebaseAuth auth = FirebaseAuth.instance;
  getDataFromCloud(BuildContext context) async {
    User? user = AuthServices.auth.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      UserModel.fromMap(value.data()!);
      loggedUserModelH = UserModel.fromMap(value.data()!);
      context.read<ImageServices>().imgstring =
          context.read<AuthServices>().loggedUserModelH.image.toString();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => UserHomeScreen(),
          ),
          (route) => false);
    });
  }

  onTabGoogleFunction(BuildContext context) async {
    try {
      final isLogged = await GoogleSignIn().isSignedIn();
      if (isLogged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();

      final cred = await result!.authentication;
      await AuthServices.auth
          .signInWithCredential(GoogleAuthProvider.credential(
              accessToken: cred.accessToken, idToken: cred.idToken))
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
