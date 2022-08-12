import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view_model/edit_user.dart';
import 'package:user_management_app/home/view/widgets/drawer.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     Provider.of<LoginProvider>(context, listen: false)
    //         .getDataFromCloud(context);
    //   },
    // );
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false, // This!
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Image.asset('assets/avthar1.png'),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(), // And this!
        ),
      ),
      drawer: const NavDrawer(),
      body: Consumer<LoginProvider>(builder: (context, value, _) {
        return ListView(
          children: [
            Column(
              children: [
                Text('Name:${value.loggedUserModelH.email} '),
                Text('Name:${value.loggedUserModelH.username} '),
                Text('Name:${value.loggedUserModelH.phone} '),
              ],
            )
          ],
        );
      }),
    );
  }
}
