import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/profile/view_model/auth_profile.dart';
import 'package:user_management_app/utilities/view/const.dart';

import 'sub_widgets/button.dart';
import 'sub_widgets/item_textform.dart';

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
              // const Padding(
              //   padding: EdgeInsets.only(top: 10.0),
              //   child: ImageTextEmployee(
              //     text: 'Image',
              //     icon: Icons.photo,
              //   ),
              // ),
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
