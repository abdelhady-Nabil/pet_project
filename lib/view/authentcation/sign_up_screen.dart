import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_app/components/constant.dart';

import '../../components/widget.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isOwner = true;
  bool isMale = true;

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
                    title: 'Sign Up',
                    function: (){
                      Navigator.pop(context);
                    }
                ),
                SizedBox(
                  height: 20,
                ),


                //toggle icons
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          isOwner=true;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: isOwner ?primaryColor:Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            color: isOwner ?primaryColor:Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: isOwner ? Colors.white :Colors.grey[300]
                                ),
                                child: Center(child: Text('1',style: TextStyle(
                                  color: isOwner ? primaryColor :Colors.grey
                                ),)),

                              ),
                              SizedBox(width: 5,),
                              Text('Owner',style: TextStyle(
                                color: isOwner ? Colors.white :Colors.grey,
                                fontSize: 16
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          isOwner=false;
                          setState(() {
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: !isOwner ?primaryColor:Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: !isOwner ?primaryColor:Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: !isOwner ? Colors.white :Colors.grey[300]
                                ),
                                child: Center(child: Text('2',style: TextStyle(
                                    color: !isOwner ? primaryColor :Colors.grey
                                ),)),

                              ),
                              SizedBox(width: 5,),
                              Text('Pet',style: TextStyle(
                                  color: !isOwner ? Colors.white :Colors.grey,
                                  fontSize: 16
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                isOwner ?

                Owner()
                    :
                Pet(),



              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget Owner(){
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: customTextFormField(
                  title: 'First Name',
                  hintText: 'Abdelhady'
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: customTextFormField(
                  title: 'Last Name',
                  hintText: 'Nabil'
              ),
            ),
          ],
        ),
        customTextFormField(
            title: 'Email',
            hintText: 'Abdelhady@gmail.com'
        ),
        customTextFormField(
            title: 'Phone Number',
            hintText: '01159398456'
        ),
        customTextFormField(
            title: 'Address',
            hintText: '123 Nile valley street , Cairo , Egypt'
        ),customTextFormField(
            title: 'Password',
            hintText: '************',
            password: true
        ),
        SizedBox(
          height: 70,
        ),
        customButton(title: 'Next', function: (){})
      ],
    );
  }
  Widget Pet(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: customTextFormField(
                  title: 'Pet Name',
                  hintText: 'Donut'
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: customTextFormField(
                  title: 'Age',
                  hintText: '3 years'
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text('Pet Type',style: TextStyle(
            fontSize: 16
        ),),
        SizedBox(
          height: 15,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChooseType(
              name: 'Dog'
            ),
            ChooseType(
                name: 'Cat'
            ),ChooseType(
                name: 'Fish'
            ),ChooseType(
                name: 'Bird'
            ),ChooseType(
                name: 'Turtle'
            ),
          ],
        ),

        SizedBox(
          height: 20,
        ),
        Text('Gender',style: TextStyle(
            fontSize: 16
        ),),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    isMale=true;
                  });
                }, icon: isMale? Icon(Icons.radio_button_checked,color: primaryColor,):Icon(Icons.radio_button_off_outlined)
                ),
                Text('Male')

              ]
            ),
            SizedBox(
              width: 30,
            ),
            Row(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      isMale=false;
                    });
                  }, icon: !isMale? Icon(Icons.radio_button_checked,color: primaryColor,):Icon(Icons.radio_button_off_outlined)
                  ),
                  Text('Female')

                ]
            ),
          ],
        ),


        SizedBox(
          height: 70,
        ),
        customButton(title: 'Next', function: (){})
      ],
    );
  }

//initialization
  String selectedType= 'Dog';

  Widget ChooseType({
  required String name
}){
    bool isSelected = selectedType == name;  // Check if this animal type is selected

    return GestureDetector(
      onTap: (){
        setState(() {
          selectedType=name;
        });
      },
      child: Container(
        width: 61,
        height: 37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:isSelected?secondColor:Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0,0, 0, 0.25), // Shadow color
              blurRadius: 4, // Softening the shadow
              spreadRadius: 0.5, // Extending the shadow
              offset: Offset(0, 0), // No offset to center the shadow
            ),
          ],

        ),
        child: Center(child: Text(name,style: TextStyle(fontSize: 14),),),
      ),
    );
  }
}
