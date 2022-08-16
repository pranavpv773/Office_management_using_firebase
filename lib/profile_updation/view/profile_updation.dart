import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/sub_screen/add_items.dart';
import 'package:user_management_app/profile_updation/view_model/profileupt_provider.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'widgets/text_form_upt.dart';
import 'widgets/update_btn.dart';

class ProfileUpdation extends StatelessWidget {
  const ProfileUpdation({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot<Object?> doc;
  @override
  Widget build(BuildContext context) {
    context.read<UpdateProfileProvider>().salaryUpdateController.text =
        doc['salary'];
    context.read<UpdateProfileProvider>().departmentUpdateController.text =
        doc['department'];
    context.read<UpdateProfileProvider>().employUpdateController.text =
        doc['employee'];
    context.read<UpdateProfileProvider>().emailUpdateController.text =
        doc['email'];
    context.read<UpdateProfileProvider>().phoneUpdateController.text =
        doc['phone'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarBackground,
        toolbarHeight: MediaQuery.of(context).size.height / 5.5,
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
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<UpdateProfileProvider>()
                  .deleteEmployee(context, doc['uid']);
            },
            icon: const Icon(Icons.person_off),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Form(
              key: context.read<UpdateProfileProvider>().updsteProfileKey,
              child: Column(
                children: [
                  // Text("ADD Products"),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: ItemsTextUpdateForm(
                      text: 'employ',
                      icon: Icons.person_pin,
                      controller: context
                          .read<UpdateProfileProvider>()
                          .employUpdateController,
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
                    child: ItemsTextUpdateForm(
                      text: 'department',
                      icon: Icons.view_in_ar_outlined,
                      controller: context
                          .read<UpdateProfileProvider>()
                          .departmentUpdateController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ItemsTextUpdateForm(
                      text: 'email',
                      icon: Icons.view_in_ar_outlined,
                      controller: context
                          .read<UpdateProfileProvider>()
                          .emailUpdateController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ItemsTextUpdateForm(
                      text: 'phone',
                      icon: Icons.view_in_ar_outlined,
                      controller: context
                          .read<UpdateProfileProvider>()
                          .phoneUpdateController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ItemsTextUpdateForm(
                      text: 'salary',
                      icon: Icons.price_change,
                      controller: context
                          .read<UpdateProfileProvider>()
                          .salaryUpdateController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: UpdateButton(
                      uid: doc['uid'],
                      primary: appBarBackground,
                      text: "UPDATE EMPLOYEE",
                      salary: context
                          .read<UpdateProfileProvider>()
                          .salaryUpdateController,
                      phone: context
                          .read<UpdateProfileProvider>()
                          .phoneUpdateController,
                      email: context
                          .read<UpdateProfileProvider>()
                          .emailUpdateController,
                      employ: context
                          .read<UpdateProfileProvider>()
                          .employUpdateController,
                      department: context
                          .read<UpdateProfileProvider>()
                          .departmentUpdateController,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
