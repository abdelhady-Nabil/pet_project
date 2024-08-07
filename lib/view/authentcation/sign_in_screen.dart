import 'package:flutter/material.dart';
import 'package:pet_app/view/authentcation/sign_up_screen.dart';

import '../../components/widget.dart';
import '../Layout/layout_screen.dart';
import 'forgot_password_screen.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerofScreen(
                  title: 'Sign in',
                  function: (){
                    Navigator.pop(context);
                  }
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Welcome Back !'),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 96,
                          height: 115,
                          child: Image.asset('assets/images/dog.png'),
                        ),
                      ],
                    ),

                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                customTextFormField(
                    title: 'Email or Phone Number',
                    hintText: '0115939846'
                ),

                customTextFormField(
                    title: 'Password',
                    hintText: '******************',
                  password: true
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    customTextButton(title:'Forgot Password', function: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                    }),
                  ],
                ),

                SizedBox(
                  height: 40,
                ),

                customButton(title: 'Sign In', function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
                }),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account ?',style: TextStyle(
                      fontSize: 12
                    ),),
                    customTextButton(title:'Sign up', function: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    }),
                  ],
                ),
                
                





              ],
            ),
          ),
        ),
      ),
    );
  }

}
