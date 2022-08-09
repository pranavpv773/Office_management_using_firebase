import 'package:flutter/material.dart';
import 'package:user_management_app/splash/view/utilities/const.dart';

class MainBodyContainer extends StatelessWidget {
  const MainBodyContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          colors: [
            primary1,
            kWhite,
          ],
        ),
      ),
      child: child,
    );
  }
}
