// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'package:user_management_app/utilities/view_model/image_services.dart';

class UserImageProvider with ChangeNotifier {
  Future<void> takePhoto(BuildContext context) async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return;

    final File imageTemprary = File(image.path);
    Provider.of<ImageServices>(context, listen: false).imagefile =
        imageTemprary;
    Provider.of<ImageServices>(context, listen: false).imagefile =
        File(image.path);

    final bayts = File(image.path).readAsBytesSync();
    String encode = base64Encode(bayts);
    context.read<ImageServices>().changeImage(encode);
    base64Encode(bayts);
    notifyListeners();
  }

  Future<void> takecamera(BuildContext context) async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (image == null) {
      return;
    }
    Provider.of<ImageServices>(context, listen: false).imagefile =
        File(image.path);

    final bayts = File(image.path).readAsBytesSync();
    String encode = base64Encode(bayts);
    context.read<ImageServices>().changeImage(encode);
    base64Encode(bayts);
    notifyListeners();
  }

  Future<void> showBottomSheetUpdate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx1) {
        return Container(
          height: 100,
          width: double.infinity,
          color: appBarBackground,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
              ],
            ),
          ),
        );
      },
    );
  }
}
