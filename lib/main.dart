import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_app/edit_employees/view_model/edit_user.dart';
import 'package:user_management_app/edit_employees/view_model/user_image.dart';
import 'package:user_management_app/home/view_model/delete_provider.dart';
import 'package:user_management_app/login/view_model/login_provider.dart';
import 'package:user_management_app/profile/view_model/auth_profile.dart';
import 'package:user_management_app/routes/routes.dart';
import 'package:user_management_app/sign_up/view_model/image_provider.dart';
import 'package:user_management_app/sign_up/view_model/sign_up_provider.dart';
import 'package:user_management_app/splash/view/splash.dart';
import 'package:user_management_app/splash/view_model/splash_provider.dart';
import 'package:user_management_app/utilities/view_model/auth_services.dart';
import 'package:user_management_app/utilities/view_model/image_services.dart';
import 'package:user_management_app/utilities/view_model/snack_top.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        ChangeNotifierProvider(
          create: (create) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => AlertLogoutBox(),
        ),
        ChangeNotifierProvider(
          create: (create) => ImageProviderSignUp(),
        ),
        ChangeNotifierProvider(
          create: (create) => EditUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => UserImageProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => SnackTProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => AuthServices(),
        ),
        ChangeNotifierProvider(
          create: (create) => ImageServices(),
        ),
        ChangeNotifierProvider(
          create: (create) => AuthProfile(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: RoutesProvider.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: "Office Management",
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(235, 245, 244, 244),
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
