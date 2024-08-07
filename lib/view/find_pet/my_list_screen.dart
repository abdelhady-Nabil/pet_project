import 'package:flutter/material.dart';

import '../../components/constant.dart';

class LostPet {
  final String name;
  final String age;
  final String breed;

  final String location;
  final String time;
  final String imageUrl;
  final String genderIcon;


  LostPet({required this.name, required this.age, required this.breed, required this.location, required this.imageUrl, required this.genderIcon,required this.time});
}

class FoundPet {
  final String name;
  final String location;
  final String time;
  final String imageUrl;
  final String genderIcon;


  FoundPet({required this.name, required this.location, required this.imageUrl, required this.genderIcon,required this.time});
}
class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  final List<LostPet> lostPets = [
    LostPet(
        name: 'Ellie',
        age: '2 years',
        breed: 'Golden Retriever',
        location: 'Cairo, Egypt (1.2 KM)',
        imageUrl: 'assets/images/dog1.png',
        genderIcon: 'assets/images/female.png',
        time: 'Since 2 days'
    ),
  ];

  Widget buildLostItem(LostPet pet) {
    return Container(
      width: 164,
      height: 200,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 106,
                  child: Image.asset(pet.imageUrl),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //Cross-Square
                      Container(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/images/Cross-Square.png'),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/images/lost.png'),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  pet.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'PoppinsBold',
                  ),
                ),
                Spacer(),
                Text(
                  pet.age,
                  style: TextStyle(
                    fontSize: 10,
                    color: grayTextColor,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 24,
                  height: 24,
                  child: Image.asset(pet.genderIcon),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              pet.breed,
              style: TextStyle(
                fontSize: 12,
                color: grayTextColor,
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: primaryColor, size: 15),
                Text(
                  pet.location,
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
                  pet.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: grayTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



  final List<FoundPet> foundPets = [
    FoundPet(
        name: 'Ellie',
        location: 'Found in zamalek',
        imageUrl: 'assets/images/dog1.png',
        genderIcon: 'assets/images/female.png',
        time: 'Found 2 days ago'
    ),

  ];

  Widget buildFoundItem(FoundPet pet) {
    return Container(
      width: 164,
      height: 200,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 106,
                  child: Image.asset(pet.imageUrl),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //Cross-Square
                      Container(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/images/Cross-Square.png'),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/images/found.png'),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  pet.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'PoppinsBold',
                  ),
                ),
                Spacer(),
                SizedBox(width: 5),
                Container(
                  width: 24,
                  height: 24,
                  child: Image.asset(pet.genderIcon),
                ),
              ],
            ),
            SizedBox(height: 5),

            Row(
              children: [
                Icon(Icons.location_on_outlined, color: primaryColor, size: 15),
                Text(
                  pet.location,
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
                  pet.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: grayTextColor,
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
                              border:
                              Border.all(color: primaryColor, width: 2)),
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
                      'My List',
                      style: TextStyle(fontSize: 20, fontFamily: 'PoppinsBold'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    buildItem(
                      title: 'Lost',
                      color: Color.fromRGBO(255,219,229, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    buildItem(
                      title: 'Found',
                      color: Color.fromRGBO(225,253,240, 1),
                    ),


                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                selectedType=='Lost'
                    ?
                lost()
                    :
                Container(),


                selectedType=='Found'
                    ?
                found()
                    :
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //initialization
  String selectedType = 'Lost';

  Widget buildItem({
    required String title,
    required Color color
  }){

    bool isSelected = selectedType == title; // Check if this animal type is selected

    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedType = title;
          });
        },
        child: Container(
          height: 37,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isSelected?Colors.black:Colors.transparent
              )
          ),
          child: Center(
            child: Text(title,style: TextStyle(
                fontSize: 16
            ),),
          ),
        ),
      ),
    );
  }


  Widget lost(){
    return Column(
      children: [

        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: lostPets.length,
          padding: EdgeInsets.all(2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.80, // Adjust the aspect ratio as needed
          ),
          itemBuilder: (context, index) {
            return buildLostItem(lostPets[index]);
          },
        ),

      ],
    );
  }

  Widget found(){
    return  Column(
      children: [

        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: foundPets.length,
          padding: EdgeInsets.all(2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.80, // Adjust the aspect ratio as needed
          ),
          itemBuilder: (context, index) {
            return buildFoundItem(foundPets[index]);
          },
        ),

      ],
    );
  }
}
