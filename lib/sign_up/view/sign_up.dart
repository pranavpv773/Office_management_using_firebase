import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/sign_up/view/widgets/sign_up_textforms.dart';
import 'package:user_management_app/sign_up/view/widgets/signup_buttons.dart';
import 'package:user_management_app/sign_up/view_model/sign_up_provider.dart';
import 'package:user_management_app/utilities/view/const.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: false,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: kWhite,
                  backgroundImage: const AssetImage(
                    "assets/avatar.jpeg",
                  ),
                ),
                SignUpTextforms(
                  icon: Icons.person_outline_outlined,
                  text: "UserName",
                  obscureText: false,
                  vertical: 40,
                  controller: context.read<SignUpProvider>().userName,
                ),
                SignUpTextforms(
                  icon: Icons.mail_outline_sharp,
                  text: "Email",
                  obscureText: false,
                  vertical: 20,
                  controller: context.read<SignUpProvider>().email,
                ),
                SignUpTextforms(
                  icon: Icons.send_to_mobile_rounded,
                  text: "Phone",
                  obscureText: false,
                  vertical: 20,
                  controller: context.read<SignUpProvider>().phoneNumber,
                ),
                SignUpTextforms(
                  icon: Icons.lock_outline,
                  text: "Password",
                  obscureText: true,
                  vertical: 20,
                  controller: context.read<SignUpProvider>().password,
                ),
                SignUpTextforms(
                  icon: Icons.lock_reset_outlined,
                  text: "Confirm Password",
                  obscureText: true,
                  vertical: 20,
                  controller: context.read<SignUpProvider>().confirmPassword,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 58.0),
                  child:
                      SignUpButtons(primary: appBarBackground, text: "SIGN UP"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: SignUpButtons(primary: Colors.blue, text: "GOOGLE"),
                )
              ],
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
