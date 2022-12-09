import 'package:appinstagram/responsive/mobile_screen_layout.dart';
import 'package:appinstagram/responsive/responsive_layout_screen.dart';
import 'package:appinstagram/responsive/web_screen_layout.dart';
import 'package:appinstagram/screens/login_screen.dart';
import 'package:appinstagram/screens/signup_screen.dart';
import 'package:appinstagram/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: SignupCcreen(),
      //const ReponsiveLayout(mobileScreenLayout:MobileScreenLayout() ,webScreenLayout:WebScreenLayout(),)
    );
  }
}

