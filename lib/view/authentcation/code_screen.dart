import 'package:flutter/material.dart';

import '../../components/constant.dart';
import '../../components/widget.dart';
import 'new_password_screen.dart';
class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  // Initialize the list with 6 TextEditingControllers
  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    // Dispose all controllers when screen is disposed
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _confirmCode() {
    String code = controllers.map((controller) => controller.text).join();
    // Print the code or use it as needed
    print("Entered code: $code");
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => NewPasswordScreen(code: code,email: widget.email,)),
    // );
  }


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
                          child: Image.asset('assets/images/r2.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Please enter the OTP sent to your phone\n number',
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


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < 4; i++)
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            controller: controllers[i],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (String value) {
                              if (value.isNotEmpty && i < 3) {
                                FocusScope.of(context).nextFocus(); // Move focus to the next TextField
                              } else if (i == 3) {
                                FocusScope.of(context).unfocus(); // Close the keyboard if it's the last TextField
                              }
                            },
                            decoration: InputDecoration(
                              counterText: '', // Hide character counter
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextButton(title: 'Resend OTP', function: (){}),
                  ],
                ),


                SizedBox(
                  height: 40,
                ),

                customButton(title: 'Continue', function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPasswordScreen()));
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
