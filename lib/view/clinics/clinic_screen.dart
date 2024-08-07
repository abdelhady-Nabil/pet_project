import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_app/components/widget.dart';
import 'package:pet_app/view/stores/cart_screen.dart';
import 'package:pet_app/view/stores/stores_details_screen.dart';


import '../../components/constant.dart';
import 'book_avisit_screen.dart';

class Doctor {
  final String name;
  final String spacilest;
  final String price;
  final String location;
  final String imageUrl;
  final bool isOpen;

  Doctor({required this.name, required this.spacilest, required this.price, required this.location, required this.imageUrl, required this.isOpen});
}



class ClinicScreen extends StatefulWidget {
  ClinicScreen({Key? key}) : super(key: key);

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {

  final List<Doctor> Doctors = [
    Doctor(
      name: 'Dr. Sara Yasser',
      spacilest: 'Certified Veterinary ',
      price: '400',
      location: 'Nasr City ',
      imageUrl: 'assets/images/d1.png',
      isOpen: true,
    ),
    Doctor(
      name: 'Dr. Mohamed Ali',
      spacilest: 'Specialized Veterinian',
      price: '350',
      location: 'Heliopolis',
      imageUrl: 'assets/images/d2.png',
      isOpen: false,
    ),
    Doctor(
      name: 'Animal Hospital',
      spacilest: 'Specialized Veterinian',
      price: '450',
      location: 'Zamalek',
      imageUrl: 'assets/images/d3.png',
      isOpen: true,
    ),
    // Add more Doctors here
  ];



  Widget buildDoctorItem(Doctor doctor) {
    return Container(
      width: 164,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25), // Shadow color
            blurRadius: 4, // Softening the shadow
            spreadRadius: 0.5, // Extending the shadow
            offset: Offset(0, 0), // No offset to center the shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 109,
              height: 144,
              child: Image.asset(doctor.imageUrl),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  doctor.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'PoppinsBold',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  doctor.spacilest,
                  style: TextStyle(
                    fontSize: 12,
                    color: grayTextColor,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: primaryColor,size: 16,),
                        Text(
                          doctor.location,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on_outlined,color: primaryColor,size: 16,),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          doctor.price+' EGP',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BookAVisitScreen(
                      doctor: doctor,
                    )));
                  },
                  child: Container(
                    width: 194,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text('Book a Visit',style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                      ),),
                    ),
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Hider of screen
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/donut.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Hi , ',style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'PoppinsBold'
                    ),),
                    Text('Donut',style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'PoppinsBold',
                        color: primaryColor
                    ),),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 14,
                      height: 14,
                      child: Image.asset('assets/images/Hand.png'),
                    ),


                  ],
                ),

                SizedBox(
                  height: 30,
                ),
                //Search
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: primaryColor
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16),
                    child: Row(
                      children: [
                        Icon(Icons.search,color: grayTextColor,),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Search here',style: TextStyle(
                            fontSize: 14,
                            color: grayTextColor
                        ),),
                      ],
                    ),
                  ),
                ),


                SizedBox(
                  height: 30,
                ),


                //Doctors
                Column(
                  children: [
                    Container(
                      height: Doctors.length*200,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildDoctorItem(Doctors[index]),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          itemCount: Doctors.length),
                    ),
                  ],
                )




              ],
            ),
          ),
        ),
      ),
    );
  }
}
