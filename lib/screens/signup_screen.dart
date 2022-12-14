
import 'dart:typed_data';

import 'package:appinstagram/resources/auth_methods.dart';
import 'package:appinstagram/screens/login_screen.dart';
import 'package:appinstagram/utils/untils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:appinstagram/utils/colors.dart';
import 'package:appinstagram/widgets/text_field_input.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
class SignupCcreen extends StatefulWidget {
  const SignupCcreen({Key? key}) : super(key: key);

  @override
  State<SignupCcreen> createState() => _SignupCcreenState();
}

class _SignupCcreenState extends State<SignupCcreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _bioController= TextEditingController();
  final TextEditingController _usernameController=TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;


  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();

  }

  void selectImage()async{
    Uint8List im= await pickImage(ImageSource.gallery);
    setState((){
      _image=im;
    });
  }
  void signUpUser()async{
    setState((){
      _isLoading=true;
    });
    String res= await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!);
    setState((){
      _isLoading=false;
    });

    if(res !='success'){
        showSnackBar(res, context);
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ReponsiveLayout(
          webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout())));
    }
  }

  void navigateToLogin(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 32),
            width:double.infinity ,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 // Flexible(child: Container(),flex: 2,),
                  //svg image
                  SvgPicture.asset("assets/ic_instagram.svg",color: primaryColor,height: 64,),
                  const SizedBox(height: 64,),
                  //cicular widget to accept and show our selected file
                  Stack(
                    children: [
                      _image!=null
                      ?CircleAvatar(
                        radius: 64,
                        backgroundImage:MemoryImage(_image!) ,
                      )
                      :
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage:NetworkImage(
                            "https://www.nicepng.com/png/detail/73-730154_open-default-profile-picture-png.png"
                        ) ,
                      ),
                      Positioned(
                        bottom: -10,
                          left: 80,
                          child: IconButton(
                        onPressed:selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      ))
                    ],
                  ),
                  const SizedBox(height: 24,),
                  //textField input for username
                  TextFieldInput(
                      textEditingController: _usernameController,
                      hintText: "Enter your username ",
                      textInputType: TextInputType.text),
                  const SizedBox(height: 24,),
                  //textField input for email
                  TextFieldInput(
                      textEditingController: _emailController,
                      hintText: "Enter your email ",
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(height: 24,),
                  //textField input for password
                  TextFieldInput(
                    textEditingController: _passwordController,
                    hintText: "Enter your password ",
                    textInputType: TextInputType.text,
                    isPass: true,),
                  const SizedBox(height: 24,),
                  TextFieldInput(
                      textEditingController: _bioController,
                      hintText: "Enter your bio ",
                      textInputType: TextInputType.text),
                  const SizedBox(height: 24,),
                  //button login
                  InkWell(
                    onTap: signUpUser,
                    child: Container(
                      child: _isLoading ? Center(child: CircularProgressIndicator(
                        color: primaryColor,
                      ),) : const Text("Sign up"),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: ShapeDecoration(shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4),),

                      ),
                          color: blueColor
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
              //    Flexible(child: Container(),flex: 2,),

                  //Transitioning to signing up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child:  Container(
                          child: Text("Do have a account?"),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                      GestureDetector(
                        onTap: navigateToLogin,
                        child: Container(
                          child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold),),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ) ,
                      )

                    ],

                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}

