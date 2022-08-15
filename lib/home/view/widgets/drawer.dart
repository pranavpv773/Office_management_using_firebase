// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view/edit_screen.dart';
import 'package:user_management_app/home/view_model/delete_provider.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'package:user_management_app/utilities/view/footer.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'package:user_management_app/utilities/view_model/image_services.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.8,
        child: Drawer(
          child: Consumer<AuthServices>(builder: (context, value, _) {
            return ListView(
              children: <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: appBarBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: MemoryImage(
                          const Base64Decoder().convert(
                            context.watch<ImageServices>().imgstring == ""
                                ? tempImage
                                : context.watch<ImageServices>().imgstring,
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          value.loggedUserModelH.username.toString(),
                          style: TextStyle(color: kUwhite),
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
                          icon: const Icon(Icons.edit),
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
                    context.read<ImageServices>().imgstring = "",
                    context.read<AlertLogoutBox>().showLogoutBox(context),
                  },
                ),
                const FooterWidgets(pad: 500)
              ],
            );
          }),
        ),
      ),
    );
  }
}
