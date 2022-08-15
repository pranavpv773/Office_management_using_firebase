import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:user_management_app/utilities/view/const.dart';

class SnackTProvider with ChangeNotifier {
  void errorBox(BuildContext context, FirebaseAuthException e) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        iconPositionLeft: 0,
        iconPositionTop: 0,
        iconRotationAngle: 0,
        icon: Icon(
          Icons.error_rounded,
          color: kUwhite,
        ),
        message: e.message.toString(),
      ),
    );
  }

  void errorPassword(BuildContext context) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        iconPositionLeft: 0,
        iconPositionTop: 0,
        iconRotationAngle: 0,
        icon: Icon(
          Icons.error,
          color: kUwhite,
        ),
        message: "password not matching",
      ),
    );
  }

  void successSnack(BuildContext context) {
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        iconPositionLeft: 0,
        iconPositionTop: 0,
        iconRotationAngle: 0,
        icon: Icon(
          Icons.done_outline_rounded,
          color: appBarBackground,
        ),
        backgroundColor: const Color.fromARGB(196, 255, 255, 255),
        message: "successfully added",
      ),
    );
  }
}
