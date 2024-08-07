import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../components/constant.dart';
import '../../components/widget.dart';
import '../stores/checkout_screen.dart';
import 'clinic_screen.dart'; // Import the intl package

class AvailableTime {
  final String time;
  bool isSelected;

  AvailableTime({required this.time, this.isSelected = false});
}
class BookAVisitScreen extends StatefulWidget {
  final Doctor doctor;
  const BookAVisitScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  State<BookAVisitScreen> createState() => _BookAVisitScreenState();
}

class _BookAVisitScreenState extends State<BookAVisitScreen> {
  DateTime selectedDate = DateTime.now();
  int selectedTimeIndex = -1;

  final List<AvailableTime> availableTimes = [
    AvailableTime(time: '10:30', isSelected: false),
    AvailableTime(time: '11:30', isSelected: false),
    AvailableTime(time: '12:30', isSelected: false),
    AvailableTime(time: '1:30', isSelected: false),
    AvailableTime(time: '2:30', isSelected: false),
    AvailableTime(time: '3:30', isSelected: false),
    AvailableTime(time: '4:30', isSelected: false),
    AvailableTime(time: '5:30', isSelected: false),
  ];

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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: primaryColor, width: 2)),
                          child: Center(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 10,
                                color: primaryColor,
                              ))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Book a visit',
                      style: TextStyle(fontSize: 20, fontFamily: 'PoppinsBold'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 125,
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
                          height: 118,
                          child: Image.asset(widget.doctor.imageUrl),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.doctor.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PoppinsBold',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.doctor.spacilest,
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
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: primaryColor,
                                      size: 16,
                                    ),
                                    Text(
                                      widget.doctor.location,
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
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      color: primaryColor,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.doctor.price + ' EGP',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Working Time',
                  style: TextStyle(fontSize: 18, fontFamily: 'PoppinsBold'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sun-Thu , 10 AM - 8 PM',
                  style: TextStyle(fontSize: 16, color: grayTextColor),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Choose The Date',
                  style: TextStyle(fontSize: 18, fontFamily: 'PoppinsBold'),
                ),
                SizedBox(
                  height: 10,
                ),

                // Date selection
                Container(
                  height: 75,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7, // Displaying 7 days for example
                    itemBuilder: (context, index) {
                      DateTime date = DateTime.now().add(Duration(days: index));
                      bool isSelected = selectedDate.day == date.day;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isSelected ? primaryColor: Colors.grey[300],
                          ),
                          margin: EdgeInsets.only(right: 10),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('E').format(date), // Format the day of the week
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  date.day.toString(),
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // Time selection
                Text(
                  'Choose The Time',
                  style: TextStyle(fontSize: 18, fontFamily: 'PoppinsBold'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: availableTimes.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedTimeIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTimeIndex = index;
                          });
                        },
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isSelected ? primaryColor: Colors.grey[300],
                          ),
                          margin: EdgeInsets.only(right: 10),
                          child: Center(
                            child: Text(
                              availableTimes[index].time,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                customButton(
                    title: 'Book Now',
                    function: () {
                      showBookingConfirmation(context);

                    }),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
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
                        'Booking Confirmed!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'PoppinsBold'
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 68,
                        height: 69,
                        child: Image.asset('assets/images/true.png'),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
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
                            child:Text('Continue',style: TextStyle(
                                color: primaryColor
                            ),),
                          ),
              
                        ),
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
