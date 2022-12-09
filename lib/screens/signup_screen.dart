import 'package:flutter/material.dart';

import 'package:appinstagram/utils/colors.dart';
import 'package:appinstagram/widgets/text_field_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
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


  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 32),
            width:double.infinity ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(),flex: 2,),
                //svg image
                SvgPicture.asset("assets/ic_instagram.svg",color: primaryColor,height: 64,),
                const SizedBox(height: 64,),
                //cicular widget to accept and show our selected file
                Stack(
                  children: [
                   const CircleAvatar(
                      radius: 64,
                      backgroundImage:NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Swift_performing_on_the_Speak_Now_Tour_in_2012.jpg/420px-Swift_performing_on_the_Speak_Now_Tour_in_2012.jpg") ,
                    ),
                    Positioned(
                      bottom: -10,
                        left: 80,
                        child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.add_a_photo),
                    ))
                  ],

                ),
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
                  onTap: (){
                    print("login ok");
                  },
                  child: Container(
                    child: const Text("Sign up"),
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
                Flexible(child: Container(),flex: 2,),

                //Transitioning to signing up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child:  Container(
                        child: Text("Don't have a account?"),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        print("sign up ok!");
                      },
                      child: Container(
                        child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold),),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ) ,
                    )

                  ],

                )

              ],
            ),
          ),
        )
    );
  }
}

