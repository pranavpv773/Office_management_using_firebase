// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view_model/user_image.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'package:user_management_app/utilities/view_model/image_services.dart';

class ImageProfileUpdate extends StatelessWidget {
  const ImageProfileUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<ImageServices>(context, listen: true)
            .imgstring
            .isNotEmpty
        ? Consumer<UserImageProvider>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  context
                      .read<UserImageProvider>()
                      .showBottomSheetUpdate(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                      image: MemoryImage(
                        const Base64Decoder()
                            .convert(context.read<ImageServices>().imgstring),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          )
        : GestureDetector(
            onTap: () {
              context.read<UserImageProvider>().showBottomSheetUpdate(context);
            },
            child: const NullImageCircle(),
          );
  }
}

class NullImageCircle extends StatelessWidget {
  const NullImageCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kUwhite,
      radius: 80,
      child: Image.asset(
        "assets/avatar.jpeg",
      ),
    );
  }
}
