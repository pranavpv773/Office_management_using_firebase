import 'package:flutter/material.dart';
import 'package:user_management_app/login/view/login_screen.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/routes/routes.dart';

class LogoutAlertBox extends StatelessWidget {
  const LogoutAlertBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kLwhite,
      content: const Text(
        'Are you sure?',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            const snackBar = SnackBar(
              content: Text('Logout Completed'),
            );
            await ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('LOGOUT'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'CANCEL',
            style: TextStyle(color: Colors.amber),
          ),
        )
      ],
    );
  }
}
