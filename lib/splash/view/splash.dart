import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/splash/view_model/splash_provider.dart';

import 'widgets/main_body_container.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashProvider>(context, listen: false).goHome(context);
    });
    return MainBodyContainer(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/backround.png",
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/footer.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
