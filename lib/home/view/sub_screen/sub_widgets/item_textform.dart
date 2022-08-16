import 'package:flutter/material.dart';
import 'package:user_management_app/utilities/view/const.dart';

class ItemsTextForm extends StatelessWidget {
  const ItemsTextForm(
      {Key? key,
      required this.text,
      required this.icon,
      required this.controller})
      : super(key: key);
  final String text;
  final IconData icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 40.0,
        left: 40,
      ),
      child: TextFormField(
        controller: controller,
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
        },
        style: TextStyle(
          color: kGrey,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          fillColor: kUwhite,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              icon,
              color: appBarBackground,
            ),
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
