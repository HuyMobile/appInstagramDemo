import 'package:appinstagram/providers/user_provider.dart';
import 'package:appinstagram/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ReponsiveLayout extends StatefulWidget {
  const ReponsiveLayout({Key? key, required this.webScreenLayout, required this.mobileScreenLayout}) : super(key: key);
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  @override
  State<ReponsiveLayout> createState() => _ReponsiveLayoutState();
}


class _ReponsiveLayoutState extends State<ReponsiveLayout> {


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constaints){
        if(constaints.maxWidth >webScreenSize){
          //web screen
          return widget.webScreenLayout;
        }
        return widget.mobileScreenLayout;
      },
    );
  }
}
