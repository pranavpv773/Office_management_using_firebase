import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view_model/user_image.dart';
import 'package:user_management_app/profile/view_model/auth_profile.dart';
import 'package:user_management_app/utilities/view/const.dart';

import 'sub_widgets/button.dart';

class AddItems extends StatelessWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarBackground,
        toolbarHeight: MediaQuery.of(context).size.height / 3.5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(100),
          ),
        ),
        title: Image.asset(
          "assets/logo.png",
          width: MediaQuery.of(context).size.width / 6,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: context.read<AuthProfile>().employeKey,
          child: Column(
            children: [
              // Text("ADD Products"),
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: ItemsTextForm(
                  text: 'Employee',
                  icon: Icons.person_pin,
                  controller: context.read<AuthProfile>().employee,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: ImageTextEmployee(
                  text: 'Image',
                  icon: Icons.photo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ItemsTextForm(
                  text: 'Department',
                  icon: Icons.view_in_ar_outlined,
                  controller: context.read<AuthProfile>().department,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ItemsTextForm(
                  text: 'Salary',
                  icon: Icons.price_change,
                  controller: context.read<AuthProfile>().salary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: AddItemButton(
                    primary: appBarBackground, text: "ADD EMPLOYEE"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              onPressed: () {
                context
                    .read<UserImageProvider>()
                    .showBottomSheetUpdate(context);
              },
              icon: Icon(icon),
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
