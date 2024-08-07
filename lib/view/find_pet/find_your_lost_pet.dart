import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/components/constant.dart';

import '../../components/widget.dart';
class FindYourLostPet extends StatefulWidget {
  const FindYourLostPet({Key? key}) : super(key: key);

  @override
  State<FindYourLostPet> createState() => _FindYourLostPetState();
}

class _FindYourLostPetState extends State<FindYourLostPet> {

  bool isOwner = true;
  bool isMale = true;
  List<String> galleryImages = [
    'assets/images/dogg.png',
  ]; // Initialize with some default images

  final ImagePicker _picker = ImagePicker();

  Future<void> addImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        galleryImages.add(pickedFile.path);
      });
    }
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
                    title: 'Find Your Lost Pet',
                    function: (){
                      Navigator.pop(context);
                    }
                ),
                SizedBox(
                  height: 20,
                ),


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

               Container(
                 width: double.infinity,
                 height: 48,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Color.fromRGBO(0,0, 0, 0.25), // Shadow color
                       blurRadius: 4, // Softening the shadow
                       spreadRadius: 0.5, // Extending the shadow
                       offset: Offset(0, 0), // No offset to center the shadow
                     ),
                   ],
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 10.0,right: 10),
                   child: Row(
                     children: [
                       Text('Choose Breed',style: TextStyle(
                         fontSize: 14,
                         color: grayTextColor
                       ),),
                       Spacer(),
                       Icon(Icons.keyboard_arrow_down),
                     ],
                   ),
                 ),

               ),

                SizedBox(
                  height: 20,
                ),
                Text('Gender',style: TextStyle(
                    fontSize: 16
                ),),

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

                Row(
                  children: [
                    Expanded(
                      child: customTextFormField(
                          title: 'last Pet location',
                          hintText: 'zamalek'
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: customTextFormField(
                          title: 'last Pet time',
                          hintText: '3  Days'
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Last seen info',style: TextStyle(
                    fontSize: 16
                ),),
                SizedBox(
                  height: 10,
                ),

                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0,0, 0, 0.25), // Shadow color
                        blurRadius: 4, // Softening the shadow
                        spreadRadius: 0.5, // Extending the shadow
                        offset: Offset(0, 0), // No offset to center the shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10),
                    child: TextFormField(
                      maxLines: 1, // Restricting to a single line
                      decoration: InputDecoration(
                        hintText: 'I am searching',
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                ),
                SizedBox(
                  height: 20,
                ),

                Text('Gallery',style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'PoppinsBold'
                ),),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var image in galleryImages)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 106,
                            height: 98,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(image),
                          ),
                        ),
                      GestureDetector(
                        onTap: addImage,
                        child: Container(
                          width: 106,
                          height: 98,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                customButton(title: 'List Now', function: (){})





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
