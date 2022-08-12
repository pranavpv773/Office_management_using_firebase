// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view/edit_screen.dart';
import 'package:user_management_app/edit_employees/view_model/edit_user.dart';
import 'package:user_management_app/login/view/utilities/utilities.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.8,
        child: Drawer(
          child: Consumer<EditUserProvider>(builder: (context, value, _) {
            return ListView(
              children: <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: appBarBackground,
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/avatar.jpeg',
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          value.loggedUserModel.username.toString(),
                          style: TextStyle(color: kLwhite),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditUserScreen(),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        )
                      ],
                    )),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: const Text(
                    'Settings',
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: const Text(
                    'Logout',
                  ),
                  onTap: () => {
                    value.logOut(context),
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
