import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:user_management_app/edit_employees/view_model/edit_user.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';
import 'package:user_management_app/sign_up/view/utilities/utilities.dart';
import 'package:user_management_app/sign_up/view/widgets/image_profile.dart';
import 'package:user_management_app/sign_up/view/widgets/sign_up_textforms.dart';
import 'package:user_management_app/sign_up/view_model/sign_up_provider.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<EditUserProvider>().nameUpdateController.text =
        context.read<LoginProvider>().loggedUserModelH.username.toString();
    context.read<EditUserProvider>().emailUpdateController.text =
        context.read<LoginProvider>().loggedUserModelH.email.toString();
    context.read<EditUserProvider>().phoneUpdateController.text =
        context.read<LoginProvider>().loggedUserModelH.phone.toString();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: false,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: context.read<EditUserProvider>().editFormKey,
              child: Column(
                children: [
                  const ImageProfileAdd(),
                  SignUpTextforms(
                    icon: Icons.person_outline_outlined,
                    text: "UserName",
                    obscureText: false,
                    vertical: 40,
                    controller:
                        context.read<EditUserProvider>().nameUpdateController,
                  ),
                  SignUpTextforms(
                    icon: Icons.mail_outline_sharp,
                    text: "Email",
                    obscureText: false,
                    vertical: 20,
                    controller:
                        context.read<EditUserProvider>().emailUpdateController,
                  ),
                  SignUpTextforms(
                    icon: Icons.send_to_mobile_rounded,
                    text: "Phone",
                    obscureText: false,
                    vertical: 20,
                    controller:
                        context.read<EditUserProvider>().phoneUpdateController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 58.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 150,
                          vertical: 15,
                        ),
                        primary: appBarBackground,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                      ),
                      onPressed: () {
                        context
                                    .read<EditUserProvider>()
                                    .emailUpdateController
                                    .text
                                    .isNotEmpty ||
                                context
                                    .read<EditUserProvider>()
                                    .phoneUpdateController
                                    .text
                                    .isNotEmpty ||
                                context
                                    .read<EditUserProvider>()
                                    .nameUpdateController
                                    .text
                                    .isNotEmpty
                            ? context.read<EditUserProvider>().updateAdmin(
                                  email: context
                                      .read<EditUserProvider>()
                                      .emailUpdateController
                                      .text,
                                  name: context
                                      .read<EditUserProvider>()
                                      .nameUpdateController
                                      .text,
                                  context: context,
                                  image:
                                      context.read<SignUpProvider>().imgstring,
                                  phone: context
                                      .read<EditUserProvider>()
                                      .phoneUpdateController
                                      .text,
                                  uid: context
                                      .read<LoginProvider>()
                                      .loggedUserModelH
                                      .uid
                                      .toString(),
                                )
                            : showTopSnackBar(
                                context,
                                CustomSnackBar.error(
                                  iconPositionLeft: 0,
                                  iconPositionTop: 0,
                                  iconRotationAngle: 0,
                                  icon: Icon(
                                    Icons.abc,
                                    color: kSwhite,
                                  ),
                                  backgroundColor: Colors.black,
                                  message: "field is empty",
                                ),
                              );
                      },
                      child: const Text(
                        "UPDATE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 84.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/footer.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
