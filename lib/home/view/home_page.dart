import 'package:flutter/material.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarBackground,
        toolbarHeight: MediaQuery.of(context).size.height / 3,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        title: Image.asset(
          "assets/logo.png",
          width: MediaQuery.of(context).size.width / 8,
        ),
        centerTitle: true,
      ),
    );
  }
}
