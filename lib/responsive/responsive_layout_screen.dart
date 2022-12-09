import 'package:appinstagram/utils/dimension.dart';
import 'package:flutter/material.dart';

class ReponsiveLayout extends StatelessWidget {
  const ReponsiveLayout({Key? key, required this.webScreenLayout, required this.mobileScreenLayout}) : super(key: key);
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constaints){
        if(constaints.maxWidth >webScreenSize){
          //web screen
          return webScreenLayout;
        }
        return mobileScreenLayout;
      },
    );
  }
}
