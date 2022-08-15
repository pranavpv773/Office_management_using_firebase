import 'package:flutter/material.dart';

class FooterWidgets extends StatelessWidget {
  const FooterWidgets({Key? key, required this.pad}) : super(key: key);
  final double pad;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: pad),
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
    );
  }
}
