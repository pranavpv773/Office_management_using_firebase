// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'package:user_management_app/utilities/view_model/image_services.dart';
import 'package:user_management_app/utilities/view_model/snack_top.dart';

class SignUpProvider with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final positon = TextEditingController();

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
          await AuthServices.auth
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
    User? user = AuthServices.auth.currentUser;

    //calling our userModel
    if (context.read<ImageServices>().imgstring == '') {
      context.read<ImageServices>().imgstring = tempImage;
    }
    context.read<AuthServices>().loggedUserModelH.email = user!.email;
    context.read<AuthServices>().loggedUserModelH.uid = user.uid;
    context.read<AuthServices>().loggedUserModelH.username = userName.text;
    context.read<AuthServices>().loggedUserModelH.phone = phoneNumber.text;
    context.read<AuthServices>().loggedUserModelH.image =
        context.read<ImageServices>().imgstring;

    //sending details to fireStore
    await firebaseFirestore.collection('users').doc(user.uid).set(
          context.read<AuthServices>().loggedUserModelH.toMap(),
        );
    disposeControll();
    context.read<SnackTProvider>().successSnack(context);
    RoutesProvider.removeScreenUntil(screen: UserHomeScreen());
  }

  disposeControll() {
    userName.clear();
    phoneNumber.clear();
    email.clear();
    confirmPassword.clear();
    password.clear();
  }
}
