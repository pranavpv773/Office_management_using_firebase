// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'package:user_management_app/utilities/view_model/image_services.dart';

class EditUserProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  final editFormKey = GlobalKey<FormState>();
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
    if (context.read<ImageServices>().imgstring.isEmpty) {
      context.read<ImageServices>().imgstring =
          context.read<AuthServices>().loggedUserModelH.image.toString();
    }
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    //calling our userModel
    context.read<AuthServices>().loggedUserModelH.email = email;
    context.read<AuthServices>().loggedUserModelH.uid = uid;
    context.read<AuthServices>().loggedUserModelH.username = name;
    context.read<AuthServices>().loggedUserModelH.phone = phone;
    context.read<AuthServices>().loggedUserModelH.image =
        context.read<ImageServices>().imgstring;
    FirebaseAuth.instance.currentUser!.updateEmail(email);

    await firebaseFirestore.collection('users').doc(uid).update(
          context.read<AuthServices>().loggedUserModelH.toMap(),
        );

    notifyListeners();
  }
}
