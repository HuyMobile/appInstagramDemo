import 'package:appinstagram/responsive/mobile_screen_layout.dart';
import 'package:appinstagram/responsive/responsive_layout_screen.dart';
import 'package:appinstagram/responsive/web_screen_layout.dart';
import 'package:appinstagram/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const ReponsiveLayout(mobileScreenLayout:MobileScreenLayout() ,webScreenLayout:WebScreenLayout(),)
    );
  }
}

