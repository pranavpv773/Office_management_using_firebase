import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/sign_up/view/widgets/image_profile.dart';
import 'package:user_management_app/sign_up/view/widgets/sign_up_textforms.dart';
import 'package:user_management_app/sign_up/view/widgets/signup_buttons.dart';
import 'package:user_management_app/sign_up/view_model/sign_up_provider.dart';

import 'widgets/signup_password.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 245, 244, 244),
      body: ListView(
        shrinkWrap: false,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: context.read<SignUpProvider>().signUpKey,
              child: Column(
                children: [
                  const ImageProfileAdd(),
                  SignUpTextforms(
                    icon: Icons.person_outline_outlined,
                    text: "UserName",
                    obscureText: false,
                    vertical: 20,
                    controller: context.read<SignUpProvider>().userName,
                  ),
                  SignUpTextforms(
                    icon: Icons.mail_outline_sharp,
                    text: "Email",
                    obscureText: false,
                    vertical: 15,
                    controller: context.read<SignUpProvider>().email,
                  ),
                  SignUpTextforms(
                    icon: Icons.send_to_mobile_rounded,
                    text: "Phone",
                    obscureText: false,
                    vertical: 15,
                    controller: context.read<SignUpProvider>().phoneNumber,
                  ),
                  PasswordTextforms(
                    icon: Icons.lock_outline,
                    text: "Password",
                    obscureText: true,
                    vertical: 15,
                    controller: context.read<SignUpProvider>().password,
                  ),
                  PasswordTextforms(
                    icon: Icons.lock_reset_outlined,
                    text: "Confirm Password",
                    obscureText: true,
                    vertical: 15,
                    controller: context.read<SignUpProvider>().confirmPassword,
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
                      onPressed: (() {
                        context.read<SignUpProvider>().signUp(
                              context,
                              context.read<SignUpProvider>().email.text,
                              context.read<SignUpProvider>().password.text,
                              context.read<SignUpProvider>().userName.text,
                              context.read<SignUpProvider>().phoneNumber.text,
                              context
                                  .read<SignUpProvider>()
                                  .confirmPassword
                                  .text,
                            );
                      }),
                      child: const Text(
                        "SIGN UP",
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SignUpButtons(primary: Colors.blue, text: "GOOGLE"),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 58.0),
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
