import 'package:flutter/material.dart';
import 'package:user_management_app/home/view/sub_screen/add_items.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view/footer.dart';

class HomeNull extends StatelessWidget {
  const HomeNull({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/empty_gif.gif',
            ),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                RoutesProvider.nextScreen(screen: const AddItems());
              },
              child: const Text(
                "Add FIles",
              ),
            ),
            const FooterWidgets(pad: 40)
          ],
        ),
      ),
    );
  }
}
