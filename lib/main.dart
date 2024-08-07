import 'package:flutter/material.dart';
import 'package:pet_app/view/on_boarding/on_boarding_screen.dart';

import 'components/constant.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: primaryColor,
        //hintColor: threeColor,
        //primarySwatch: Colors.teal
      ),
      home: StartScreen(),
    );
  }
}


