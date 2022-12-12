
import 'package:appinstagram/resources/auth_methods.dart';
import 'package:appinstagram/utils/colors.dart';
import 'package:appinstagram/utils/untils.dart';
import 'package:appinstagram/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool _isLoading= false;

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }

  void loginUser()async{
    setState((){
      _isLoading=true;
    });
    String res= await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
    if(res=="success"){

    }else{
      showSnackBar(res, context);
    }
    setState((){
      _isLoading=false;
    });
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
              //button login
              InkWell(
                onTap: loginUser,
                child: _isLoading ? const Center(child: CircularProgressIndicator(
                  color: primaryColor,
                ),) : Container(
                  child: const Text("Login"),
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
