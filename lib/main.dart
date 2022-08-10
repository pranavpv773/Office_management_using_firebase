import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/login/view_model/home_provider.dart';
import 'package:user_management_app/splash/view/splash.dart';
import 'package:user_management_app/splash/view_model/splash_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Office Management",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
