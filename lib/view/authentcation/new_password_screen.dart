import 'package:flutter/material.dart';

import '../../components/constant.dart';
import '../../components/widget.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

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
                    title: 'Reset password',
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 248,
                          height: 165,
                          child: Image.asset('assets/images/r3.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Enter your new password',
                          style: TextStyle(
                              fontSize: 14,
                              color: grayTextColor
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                  ],
                ),


                SizedBox(
                  height: 20,
                ),

                customTextFormField(
                    title: 'password',
                    hintText: '*****************',
                  password: true
                ),

                customTextFormField(
                    title: 'Confirm Password',
                    hintText: '*****************',
                    password: true
                ),


                SizedBox(
                  height: 40,
                ),

                customButton(title: 'Reset Password', function: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeScreen()));
                }),
                SizedBox(
                  height: 5,
                ),







              ],
            ),
          ),
        ),
      ),
    );
  }
}
