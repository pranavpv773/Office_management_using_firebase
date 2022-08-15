import 'package:flutter/material.dart';
import 'package:user_management_app/home/view/sub_screen/add_items.dart';
import 'package:user_management_app/home/view/widgets/drawer.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'package:user_management_app/utilities/view/footer.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              RoutesProvider.nextScreen(
                screen: const AddItems(),
              );
            },
            child: Text(
              "ADD",
              style: TextStyle(
                color: kUwhite,
              ),
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        iconTheme: IconThemeData(color: kUwhite),
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: kUwhite,
            radius: 100,
            backgroundImage: const AssetImage(
              'assets/avthar1.png',
            ),
          ),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: const NavDrawer(),
      body: Container(
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
                  )),
              const FooterWidgets(pad: 40)
            ],
          ),
        ),
      ),
    );
  }
}
