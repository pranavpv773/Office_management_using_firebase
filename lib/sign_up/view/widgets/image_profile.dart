// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                    context
                        .read<ImageProviderSignUp>()
                        .showBottomSheet(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                          image: MemoryImage(
                            const Base64Decoder().convert(
                              value.imgstring,
                            ),
                          ),
                          fit: BoxFit.cover,
                        )),
                  ));
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
