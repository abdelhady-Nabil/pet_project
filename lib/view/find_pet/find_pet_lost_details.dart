import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_app/components/constant.dart';
import 'package:pet_app/components/widget.dart';

import '../home/home_screen.dart';
import 'find_pet_screen.dart';




class FindPetLostDetails extends StatefulWidget {
  final LostPet pet;
  FindPetLostDetails({Key? key,required this.pet}) : super(key: key);

  @override
  State<FindPetLostDetails> createState() => _FindPetLostDetailsState();
}

class _FindPetLostDetailsState extends State<FindPetLostDetails> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [

                      Container(
                        width: double.infinity,
                        height: 296,
                        child: Image.asset(widget.pet.imageUrl,fit: BoxFit.cover,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap:(){
                                Navigator.pop(context);
                              },
                              child: Container(

                                width: 25,
                                height: 25,
                                child: Image.asset('assets/images/ArrowBack.png'),
                              ),
                            ),
                            Spacer(),

                            Container(
                              width: 32,
                              height: 32,
                              child: Image.asset('assets/images/lost.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //categories

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.pet.name,style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'PoppinsBold'
                        ),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: primaryColor, size: 15),
                                Text(
                                  widget.pet.location,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: grayTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.watch_later_outlined, color: primaryColor, size: 13),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  widget.pet.time,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: grayTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(widget.pet.breed,style: TextStyle(
                            fontSize: 16,
                            color: grayTextColor
                        ),),

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 41,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 219, 229, 1),
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(widget.pet.genderIcon),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Female',style: TextStyle(
                                    fontSize: 16
                                ),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 41,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 246, 210, 1),
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 24,
                                    height: 24,
                                    child: Icon(Icons.cake_outlined,color: Color.fromRGBO(249, 175, 196, 1),)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('2 Years',style: TextStyle(
                                    fontSize: 16
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Image.asset('assets/images/owner.png',fit: BoxFit.fill,),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Maram Mohamed',style: TextStyle(fontSize: 14),),
                            Text('Pet Owner',style: TextStyle(fontSize: 14,color: grayTextColor),)

                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: primaryColor, size: 15),
                            Text(
                              widget.pet.location,
                              style: TextStyle(
                                fontSize: 12,
                                color: grayTextColor,
                              ),
                            ),
                          ],
                        ),

                      ],
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
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 106,
                              height: 98,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset('assets/images/dogg.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 106,
                              height: 98,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset('assets/images/dogg.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 106,
                              height: 98,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset('assets/images/dogg.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 106,
                              height: 98,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset('assets/images/dogg.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Last seen info',style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'PoppinsBold'
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    Text('We are urgently searching for a beige poodle who went missing in the October area three days ago, on [15th of June]. The dog is friendly but may be scared and disoriented.  If you have any information, please send us a message on the app or contact us immediately at [012345678] .  We are very worried and any leads would be greatly appreciated.',style: TextStyle(
                      fontSize: 14,
                      color: grayTextColor
                    ),),

                    SizedBox(
                      height: 30,
                    ),
                    customButton(title: 'Send a message', function: (){

                      showBookingConfirmation(context);

                    }),

                    SizedBox(
                      height: 300,
                    ),






                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }

  void showBookingConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Stack(
            children: [

              Container(
                height: 223,
                width: double.infinity,
                child: Image.asset('assets/images/back.png'),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: primaryColor,
                ),
              ),
              Container(
                height: 223,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Potential Match!',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'PoppinsBold'
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Send a request to start a chat!',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'PoppinsBold'
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 150,
                                height: 46,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white
                                ),
                                child: Center(
                                  child:Text('Send a request',style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 14

                                  ),),
                                ),

                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 150,
                                height: 46,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: primaryColor,
                                    border: Border.all(
                                        color: Colors.white
                                    )
                                ),
                                child: Center(
                                  child:Text('Cancel request',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14
                                  ),),
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),

            ],
          ),
        );
      },
    );
  }


}


