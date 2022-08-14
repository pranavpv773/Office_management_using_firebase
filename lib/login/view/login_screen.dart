import 'package:flutter/material.dart';
import 'package:user_management_app/login/view/widgets/login_text_forms.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'widgets/login_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;
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
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(217, 243, 241, 241),
        ),
        child: Column(
          children: [
            const LoginTextforms(),
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
              padding: const EdgeInsets.only(top: 55.0),
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
