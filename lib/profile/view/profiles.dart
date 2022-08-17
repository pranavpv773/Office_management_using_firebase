import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_management_app/profile_updation/view/profile_updation.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/utilities/view/const.dart';

class EmployeeHome extends StatelessWidget {
  const EmployeeHome({
    Key? key,
    required this.employ,
    required this.email,
    required this.phone,
    required this.depart,
    required this.salary,
    required this.doc,
  }) : super(key: key);

  final String employ;
  final String email;
  final String phone;
  final String depart;
  final String salary;
  final QueryDocumentSnapshot<Object?> doc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => RoutesProvider.nextScreen(
        screen: ProfileUpdation(
          doc: doc,
        ),
      ),
      child: Padding(
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
                      tag: 'avathar$employ',
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: MemoryImage(
                          const Base64Decoder().convert(
                            tempImage,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          employ,
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Nunito',
                            color: kUwhite,
                          ),
                        ),
                        Text(
                          depart,
                          style: TextStyle(
                            color: kUwhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Nunito',
                            color: kUwhite,
                          ),
                        ),
                        Text(
                          phone,
                          style: TextStyle(
                            color: kUwhite,
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
                          style: TextStyle(
                            color: kUwhite,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Material(
                          elevation: 6,
                          child: InkWell(
                            child: Container(
                              color: kUwhite,
                              child: const Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Text(
                                  'Pay Now',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
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
      ),
    );
  }
}
