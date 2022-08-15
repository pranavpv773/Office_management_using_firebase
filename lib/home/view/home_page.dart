import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/home/view/sub_screen/add_items.dart';
import 'package:user_management_app/home/view/widgets/drawer.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view/const.dart';
import 'package:user_management_app/utilities/view/footer.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'package:user_management_app/utilities/view_model/image_services.dart';

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
              .collection('employee')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
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
                          )),
                      const FooterWidgets(pad: 40)
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  String depart = snapshot.data!.docs[index]['department'];

                  String salary = snapshot.data!.docs[index]['salary'];

                  String employ = snapshot.data!.docs[index]['employee'];
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                child: Material(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                  elevation: 10,
                                  child: Container(
                                    height: constraints.maxHeight * 0.8,
                                    width: constraints.maxWidth,
                                    decoration: BoxDecoration(
                                      color: appBarBackground,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(70),
                                        topRight: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 36,
                                top: 25,
                                child: Hero(
                                  tag: '',
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: MemoryImage(
                                      const Base64Decoder().convert(
                                        context.read<ImageServices>().imgstring,
                                      ),
                                      // width: constraints.maxWidth * 0.6,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 40,
                                left: 30,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      employ,
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontFamily: 'Nunito',
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      depart,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 40,
                                right: 50,
                                child: Column(
                                  children: [
                                    Text(
                                      'Salary: $salary',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Material(
                                      elevation: 6,
                                      child: InkWell(
                                        // onTap: () => Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => ShortEatsDetailsPage(
                                        //       image: image,
                                        //       itemName: itemName,
                                        //     ),
                                        //   ),
                                        // ),
                                        child: Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: Text(
                                              'Pay Now',
                                              style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: Colors.orange[900],
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }),
              );
            }
          }),
    );
  }
}
