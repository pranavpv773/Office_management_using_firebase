import 'package:flutter/material.dart';
import 'package:user_management_app/home/view/sub_screen/add_items.dart';
import 'package:user_management_app/home/view/widgets/drawer.dart';
import 'package:user_management_app/utilities/view/const.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false, // This!
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddItems(),
                ),
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
      body: const Center(
        child: Text(
          "Add FIles",
        ),
      ),
    );
  }
}
