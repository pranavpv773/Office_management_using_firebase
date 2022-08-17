import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view/login_screen.dart';
import 'package:user_management_app/profile_updation/view_model/profileupt_provider.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view/const.dart';

class DeleteAlertBox extends StatelessWidget {
  const DeleteAlertBox({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot<Object?> doc;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kUwhite,
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
            context
                .read<UpdateProfileProvider>()
                .deleteEmployee(context, doc['uid']);
            RoutesProvider.removeScreen(screen: const LoginScreen());
            const snackBar = SnackBar(
              content: Text('Deletion Completed'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('DELETE'),
        ),
        TextButton(
          onPressed: () {
            RoutesProvider.backScreen();
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
