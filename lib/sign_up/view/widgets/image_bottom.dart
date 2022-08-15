import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/sign_up/view_model/image_provider.dart';
import 'package:user_management_app/utilities/view/const.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  context.read<ImageProviderSignUp>().takecamera(context);
                },
                icon: Icon(
                  Icons.camera_front_outlined,
                  color: kUwhite,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<ImageProviderSignUp>().takePhoto(context);
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
  }
}
