import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    Key? key,
    required this.primary,
    required this.text,
    this.function,
  }) : super(key: key);
  final Color primary;
  final String text;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 120,
          vertical: 15,
        ),
        primary: primary,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
      ),
      onPressed: () {
        // try {
        //   context.read<LoginProvider>().onTabGoogleFunction(context);
        // } catch (e) {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text(e.toString()),
        //   ));
        // }
      },
      child: Text(
        text,
      ),
    );
  }
}
