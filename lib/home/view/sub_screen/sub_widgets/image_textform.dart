import 'package:flutter/material.dart';
import 'package:user_management_app/utilities/view/const.dart';

class ImageTextEmployee extends StatelessWidget {
  const ImageTextEmployee({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 40.0,
        left: 40,
      ),
      child: TextFormField(
        style: TextStyle(
          color: kGrey,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          fillColor: kUwhite,
          filled: true,
          suffixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            // child: IconButton(
            //   onPressed: () {
            //     context.read<ImageProfileUpdator>().showBottomSheet(context);
            //   },
            //   icon: Icon(icon),
            //   color: appBarBackground,
            // ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.teal,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          labelText: text,
          labelStyle: TextStyle(
            fontSize: 15,
            color: appBarBackground,
          ),
        ),
      ),
    );
  }
}
