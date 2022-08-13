// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/sign_up/view/utilities/utilities.dart';
import 'package:user_management_app/sign_up/view_model/image_provider.dart';
import 'package:user_management_app/sign_up/view_model/sign_up_provider.dart';

class ImageProfileAdd extends StatelessWidget {
  const ImageProfileAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<SignUpProvider>(context, listen: true)
            .imgstring
            .isNotEmpty
        ? Consumer<SignUpProvider>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  context.read<ImageProviderSignUp>().showBottomSheet(context);
                },
                child: CircleAvatar(
                  backgroundColor: kSwhite,
                  radius: 80,
                  child: Image.memory(
                    const Base64Decoder().convert(
                      value.imgstring,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          )
        : GestureDetector(
            onTap: () {
              context.read<ImageProviderSignUp>().showBottomSheet(context);
            },
            child: CircleAvatar(
              backgroundColor: kSwhite,
              radius: 80,
              child: Image.asset(
                "assets/avatar.jpeg",
              ),
            ),
          );
  }
}
