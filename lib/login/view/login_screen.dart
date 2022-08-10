import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/login/view/widgets/login_buttons.dart';
import 'package:user_management_app/login/view/widgets/login_text_forms.dart';
import 'package:user_management_app/login/view/widgets/social_icons.dart';
import 'package:user_management_app/login/view_model/home_provider.dart';

import 'widgets/login_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(217, 243, 241, 241)),
        child: ListView(
          children: [
            Column(
              children: [
                LoginTextforms(
                  text: 'Email',
                  icon: Icons.mail,
                  obscureText: false,
                  vertical: 60,
                  controller: context.read<LoginProvider>().userName,
                ),
                LoginTextforms(
                  text: 'Password',
                  icon: Icons.key,
                  obscureText: true,
                  vertical: 28,
                  controller: context.read<LoginProvider>().password,
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
                      child: LoginButtons(
                        primary: appBarBackground,
                        text: 'LOGIN',
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
                          padding: EdgeInsets.only(top: 18.0),
                          child: SocialIcons(
                            primary: Colors.blue,
                            text: ' GOOGLE',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 15,
                    ),
                  ),
                  const LoginTextButton(
                    text: "Register",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
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
      ),
    );
  }
}
