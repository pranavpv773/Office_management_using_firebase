// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';
import 'package:user_management_app/sign_up/view_model/sign_up_provider.dart';
import 'package:user_management_app/utilities/view/const.dart';

class ImageProviderSignUp with ChangeNotifier {
  Widget imageprofile(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          showBottomSheet(context);
        },
        child: CircleAvatar(
          backgroundColor: kUwhite,
          radius: 80,
          child: value.loggedUserModelH.image.toString().trim().isNotEmpty
              ? CircleAvatar(
                  radius: 80,
                  backgroundImage: MemoryImage(
                    const Base64Decoder()
                        .convert(value.loggedUserModelH.image.toString()),
                  ),
                )
              : CircleAvatar(
                  backgroundColor: kUwhite,
                  radius: 100,
                  backgroundImage: const AssetImage(
                    'assets/avthar1.png',
                  ),
                ),
        ),
      );
    });
  }

  Future<void> takePhoto(BuildContext context) async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return;

    Provider.of<SignUpProvider>(context, listen: false).imagefile =
        File(image.path);

    final bayts = File(image.path).readAsBytesSync();
    String encode = base64Encode(bayts);
    context.read<SignUpProvider>().changeImage(encode);
    base64Encode(bayts);
  }

  Future<void> takecamera(BuildContext context) async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (image == null) {
      return;
    }

    Provider.of<SignUpProvider>(context, listen: false).imagefile =
        File(image.path);

    final bayts = File(image.path).readAsBytesSync();
    String encode = base64Encode(bayts);
    context.read<SignUpProvider>().changeImage(encode);
    base64Encode(bayts);
  }

  Future<void> showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          width: double.infinity,
          color: appBarBackground,
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Column(children: [
              Text(
                'choose your profile photo',
                style: TextStyle(
                  color: kUwhite,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      takecamera(context);
                    },
                    icon: Icon(
                      Icons.camera_front_outlined,
                      color: kUwhite,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      takePhoto(context);
                    },
                    icon: Icon(
                      Icons.image_rounded,
                      color: kUwhite,
                    ),
                  )
                ],
              )
            ]),
          ),
        );
      },
    );
  }
}
