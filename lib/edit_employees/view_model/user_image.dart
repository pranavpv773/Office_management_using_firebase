// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view/widgets/bottomsheet_img.dart';
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
        return const ImageBottomSheetUpdate();
      },
    );
  }
}
