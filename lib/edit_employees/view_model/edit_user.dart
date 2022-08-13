// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';

class EditUserProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  final editFormKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();

  final nameUpdateController = TextEditingController();

  final emailUpdateController = TextEditingController();

  final phoneUpdateController = TextEditingController();
  updateAdmin({
    required String email,
    required String name,
    required BuildContext context,
    required String image,
    required String phone,
    required String uid,
  }) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    //calling our userModel

    userModel.email = email;
    userModel.uid = uid;
    userModel.username = name;
    userModel.phone = phone;
    userModel.image = "";
    FirebaseAuth.instance.currentUser!.updateEmail(email);
    await firebaseFirestore.collection('users').doc(uid).update(
          userModel.toMap(),
        );
    context.read<LoginProvider>().loggedUserModelH = userModel;
    notifyListeners();
  }
}
