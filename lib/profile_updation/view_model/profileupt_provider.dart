// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/profile/view_model/auth_profile.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'package:user_management_app/utilities/view_model/image_services.dart';
import 'package:user_management_app/utilities/view_model/snack_top.dart';

class UpdateProfileProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  final updsteProfileKey = GlobalKey<FormState>();
  final employUpdateController = TextEditingController();
  final emailUpdateController = TextEditingController();
  final phoneUpdateController = TextEditingController();
  final departmentUpdateController = TextEditingController();
  final salaryUpdateController = TextEditingController();
  updateEmploy(
      {required String email,
      required String employ,
      required String department,
      required BuildContext context,
      String? image,
      required String phone,
      required String salary,
      required String uid}) async {
    if (context.read<ImageServices>().imgstring.isEmpty) {
      context.read<ImageServices>().imgstring =
          context.read<AuthServices>().loggedUserModelH.image.toString();
    }
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    //calling our userModel
    context.read<AuthProfile>().homeModel.employee = employ;
    context.read<AuthProfile>().homeModel.email = email;
    context.read<AuthProfile>().homeModel.department = department;

    context.read<AuthProfile>().homeModel.phone = phone;
    context.read<AuthProfile>().homeModel.image =
        context.read<ImageServices>().imgstring;

    await firebaseFirestore
        .collection('users')
        .doc(context.read<AuthServices>().loggedUserModelH.uid)
        .collection('employe')
        .doc(uid)
        .update(
          context.read<AuthProfile>().homeModel.toMap(),
        );

    context.read<SnackTProvider>().successSnack(context);
    notifyListeners();
  }

  Future<void> deleteEmployee(BuildContext context, String uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('users')
        .doc(context.read<AuthServices>().loggedUserModelH.uid)
        .collection('employe')
        .doc(uid)
        .delete();
    RoutesProvider.removeScreen(screen: UserHomeScreen());

    context.read<SnackTProvider>().successSnack(context);
    notifyListeners();
  }
}
