import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/sub_screen/add_items.dart';
import 'package:user_management_app/home/view/widgets/drawer.dart';
import 'package:user_management_app/profile/view/profiles.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'widgets/home_null.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kUwhite,
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(context.read<AuthServices>().loggedUserModelH.uid)
              .collection('employe')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const HomeNull();
            } else if (snapshot.data!.docs.isEmpty) {
              return const HomeNull();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  return EmployeeHome(
                    employ: snapshot.data!.docs[index]['employee'],
                    email: snapshot.data!.docs[index]['email'],
                    phone: snapshot.data!.docs[index]['phone'],
                    depart: snapshot.data!.docs[index]['department'],
                    salary: snapshot.data!.docs[index]['salary'],
                    doc: snapshot.data!.docs[index],
                  );
                }),
              );
            }
          }),
    );
  }
}
