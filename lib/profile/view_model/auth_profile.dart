// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/home_page.dart';
import 'package:user_management_app/profile/model/model_profile.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'package:user_management_app/utilities/view_model/snack_top.dart';

class AuthProfile with ChangeNotifier {
  final employeKey = GlobalKey<FormState>();
  HomeModel homeModel = HomeModel();
  final employee = TextEditingController();
  final department = TextEditingController();
  final salary = TextEditingController();

  void employeeDetailsToFirebase(BuildContext context) async {
    if (employeKey.currentState!.validate()) {
      try {
        // calling our fireStore
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

        //calling our userModel

        homeModel.employee = employee.text;
        homeModel.department = department.text;
        homeModel.salary = salary.text;
        homeModel.email = "Add email";
        homeModel.uid = 'temp';
        homeModel.phone = 'add phone number';

        //sending details to fireStore
        final genarateId = await firebaseFirestore
            .collection('users')
            .doc(context.read<AuthServices>().loggedUserModelH.uid)
            .collection('employe')
            .add(
              homeModel.toMap(),
            );
        homeModel.uid = genarateId.id;
        await firebaseFirestore
            .collection('users')
            .doc(context.read<AuthServices>().loggedUserModelH.uid)
            .collection('employe')
            .doc(homeModel.uid)
            .update(
              homeModel.toMap(),
            );
        employee.clear();
        department.clear();
        salary.clear();
        context.read<SnackTProvider>().successSnack(context);
        RoutesProvider.removeScreenUntil(screen: UserHomeScreen());
      } on FirebaseException catch (e) {
        context.read<SnackTProvider>().errorBox(context, e.message.toString());
      }
    }
  }
}
