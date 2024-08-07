import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constant.dart';


Widget customButton({
  required String title,
  required var function,
}){
  return  GestureDetector(
    onTap: function,
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:primaryColor
      ),
      child: Center(child: Text(title,style: TextStyle(fontSize: 18,color: Colors.white),)),
    ),
  );
}



Widget customTextFormField({
  required String title,
  required String hintText,
   bool password =false

}){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 15,
      ),
      Text(title,style: TextStyle(
          fontSize: 16
      ),),
      SizedBox(
        height: 8,
      ),
      TextFormField(
        obscureText: password,
        decoration: InputDecoration(
          suffixIcon:password?Icon(Icons.remove_red_eye_outlined):Container(
            width: 1,
            height: 1,
          ),
          hintText: hintText,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ],
  );

}

Widget customTextButton({
  required String title,
  required var function,
}){
  return TextButton(onPressed: function, child: Text(title,style: TextStyle(
    color: primaryColor,
    fontSize: 12
  ),));
}


void showToast({
  required String message,
  required Color color
})=> Fluttertoast.showToast(
msg: message,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor:color,
textColor: Colors.white,
fontSize: 20
);


Widget headerofScreen({
  required String title,
  required var function
}){
  return Row(
    children: [
      GestureDetector(
        onTap:function,
        child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: primaryColor,width: 2)
            ),
            child: Center(
                child: Icon(Icons.arrow_back_ios_new,size: 10,color: primaryColor,)
            )
        ),
      ),
      SizedBox(
        width: 15,
      ),
      Text(title,style: TextStyle(
          fontSize: 20,
          fontFamily: 'PoppinsBold'
      ),),
    ],
  );
}

