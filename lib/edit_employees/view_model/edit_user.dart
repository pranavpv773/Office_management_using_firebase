// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';
import 'package:user_management_app/sign_up/model/signup_model.dart';

class EditUserProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUserModelE = UserModel();
  final editFormKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();

  final nameUpdateController = TextEditingController();

  final emailUpdateController = TextEditingController();

  final phoneUpdateController = TextEditingController();

  // Future<void> updateStudent(
  //     BuildContext context, StudentModel studentmodel) async {

  //   else {
  //     final studentup = StudentModel(
  //       name: name,
  //       age: age,
  //       phoneNumber: phone,
  //       place: places,
  //       imgstri: context.read<StudentDbFunctions>().imgstring,
  //       id: studentmodel.id,
  //     );

  //     await Provider.of<StudentDbFunctions>(_formkey.currentContext!,
  //             listen: false)
  //         .studentupdate(studentup.id!, studentup);

  //     // context.read<StudentDbFunctions>().imgstring = '';
  //   }
  // }

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
// }
}
