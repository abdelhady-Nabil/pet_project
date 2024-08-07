import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../../components/constant.dart';
import '../../components/widget.dart';
import '../authentcation/sign_in_screen.dart';
import '../authentcation/sign_up_screen.dart';


class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.asset('assets/images/start.png',fit: BoxFit.contain,),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Welcom to Petify',style: TextStyle(
                fontFamily: 'PoppinsBold',
                fontSize: 20
              ),),
              SizedBox(
                height: 20,
              ),
              Text(' Your one-stop shop for all things pet! Find your furry soulmate through our innovative dating feature, connect with local clinics and stores, browse adoptable pets, or even find your dream breed through reputable breeders',
                style: TextStyle(
                  fontSize: 14,
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contetx)=>SignUpScreen()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Colors.white,
                          border: Border.all(
                            color: primaryColor
                          )
                        ),
                        child: Center(child: Text('Sign Up',style: TextStyle(fontSize: 18,color: primaryColor),)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: customButton(title: 'Sign in', function: (){
                    Navigator.push(context, MaterialPageRoute(builder: (contetx)=>SignInScreen()));

                    //SignInScreen
                  })),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
