import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view_model/edit_user.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/sign_up/view/widgets/sign_up_textforms.dart';
import 'package:user_management_app/utilities/view/const.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              key: context.read<EditUserProvider>().editUserKey,
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
                    controller: context.read<EditUserProvider>().userName,
                  ),
                  SignUpTextforms(
                    icon: Icons.mail_outline_sharp,
                    text: "Email",
                    obscureText: false,
                    vertical: 20,
                    controller: context.read<EditUserProvider>().email,
                  ),
                  SignUpTextforms(
                    icon: Icons.send_to_mobile_rounded,
                    text: "Phone",
                    obscureText: false,
                    vertical: 20,
                    controller: context.read<EditUserProvider>().phoneNumber,
                  ),
                  SignUpTextforms(
                    icon: Icons.lock_outline,
                    text: "Password",
                    obscureText: true,
                    vertical: 20,
                    controller: context.read<EditUserProvider>().password,
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
                        // context.read<EditUserProvider>().signUp(
                        //       context,
                        //       context.read<EditUserProvider>().email.text,
                        //       context.read<EditUserProvider>().password.text,
                        //     );
                      }),
                      child: const Text(
                        "SIGN UP",
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