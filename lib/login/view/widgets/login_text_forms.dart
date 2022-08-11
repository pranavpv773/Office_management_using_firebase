import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/login/view/widgets/social_icons.dart';
import 'package:user_management_app/login/view_model/home_provider.dart';

import 'login_text.dart';

class LoginTextforms extends StatelessWidget {
  const LoginTextforms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginProvider>().formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 40, left: 40),
            child: Material(
              elevation: 8,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " Please fill this field";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: context.read<LoginProvider>().email,
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    fillColor: kwhite,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.mail,
                        color: appBarBackground,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: kwhite,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.teal,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 2.0,
                      ),
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: kGrey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 40, left: 40),
            child: Material(
              elevation: 8,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " Please fill this field";
                    }
                  },
                  controller: context.read<LoginProvider>().password,
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 18,
                  ),
                  obscuringCharacter: '*',
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: kwhite,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.key,
                        color: appBarBackground,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: kwhite,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.teal,
                        width: 2.0,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: "password",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: kGrey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                LoginTextButton(
                  text: 'Forgot Password ?',
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
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
                  onPressed: (() async {
                    context.read<LoginProvider>().onTabLoginFunction(
                        context,
                        context.read<LoginProvider>().email.text,
                        context.read<LoginProvider>().password.text);
                  }),
                  child: const Text(
                    "LOGIN",
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Center(
                  child: Text(
                    "OR",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 13.0),
                    child: SocialIcons(
                      primary: Colors.blue,
                      text: ' GOOGLE',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.0),
                    child: SocialIcons(
                      primary: Colors.black,
                      text: ' TWITTER',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
