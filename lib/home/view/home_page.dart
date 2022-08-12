import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view_model/edit_user.dart';
import 'package:user_management_app/home/view/widgets/drawer.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<EditUserProvider>(context, listen: false)
            .getDataFromCloud();
      },
    );
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
      body: Consumer<EditUserProvider>(builder: (context, value, _) {
        return ListView(
          children: [
            Column(
              children: [
                Text('Name:${value.loggedUserModel.email} '),
                Text('Name:${value.loggedUserModel.username} '),
                Text('Name:${value.loggedUserModel.phone} '),
              ],
            )
          ],
        );
      }),
    );
  }
}
