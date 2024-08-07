import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/components/constant.dart';
import 'package:pet_app/components/widget.dart';
import 'package:pet_app/view/home/pet_detaing_profile.dart';

class Pet {
  final String name;
  final String age;
  final String breed;

  final String location;
  final String time;
  final String imageUrl;
  final String genderIcon;


  Pet({required this.name, required this.age, required this.breed, required this.location, required this.imageUrl, required this.genderIcon,required this.time});
}



class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);


  final List<Pet> pets = [
    Pet(
      name: 'Ellie',
      age: '2 years',
      breed: 'Golden Retriever',
      location: 'Cairo, Egypt (1.2 KM)',
      imageUrl: 'assets/images/dog1.png',
      genderIcon: 'assets/images/female.png',
      time: 'Since 2 days'

    ),
    Pet(
      name: 'Andy',
      age: '5 years',
      breed: 'Dachshund',
      location: 'Cairo, Egypt (1.2 KM)',
      imageUrl: 'assets/images/dog2.png',
      genderIcon: 'assets/images/male.png',
        time: 'Since 3 days'

    ),
    Pet(
      name: 'Andy',
      age: '5 years',
      breed: 'Dachshund',
      location: 'Cairo, Egypt (1.2 KM)',
      imageUrl: 'assets/images/dog2.png',
      genderIcon: 'assets/images/male.png',
        time: 'Since 4 days'

    ),
    Pet(
      name: 'Ellie',
      age: '2 years',
      breed: 'Golden Retriever',
      location: 'Cairo, Egypt (1.2 KM)',
      imageUrl: 'assets/images/dog1.png',
      genderIcon: 'assets/images/female.png',
        time: 'Since 2 days'

    ),
    // Add more pets here
  ];

   Widget buildPetItem(Pet pet,BuildContext context) {
     return GestureDetector(
       onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>PetDatingProfile(
           pet: pet,
         )));
       },
       child: Container(
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
               Container(
                 width: double.infinity,
                 height: 106,
                 child: Image.asset(pet.imageUrl),
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
             ],
           ),
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
                    Spacer(),
                    Container(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/images/chat.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/images/noti.png'),
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
                        Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          child: Image.asset('assets/images/Filter.png'),
                        ),
                      ],
                    ),
                  ),
                ),
            
            
                SizedBox(
                  height: 30,
                ),
            
                //banner
            
                Container(
                  width: double.infinity,
                  height: 143,
                  child: Image.asset('assets/images/banner.png'),
                ),


                SizedBox(
                  height: 30,
                ),


                //categories

                Text('Categories',style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'PoppinsBold'
                ),),

                SizedBox(
                  height: 16,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                  
                      buildAnimal(
                          image: 'assets/images/DogFace.png',
                          name: 'Dogs'
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      buildAnimal(
                        image: 'assets/images/CatFace.png',
                        name: 'Cats'
                      ),SizedBox(
                        width: 15,
                      ),
                      buildAnimal(
                        image: 'assets/images/Fish.png',
                        name: 'Fish'
                      ),SizedBox(
                        width: 15,
                      ),
                      buildAnimal(
                        image: 'assets/images/BabyChick.png',
                        name: 'Bird'
                      ),SizedBox(
                        width: 15,
                      ),
                      buildAnimal(
                        image: 'assets/images/Turtle.png',
                        name: 'Turtle'
                      ),SizedBox(
                        width: 15,
                      ),
                      buildAnimal(
                        image: 'assets/images/Monkey.png',
                        name: 'Monkey'
                      ),SizedBox(
                        width: 15,
                      ),
                      buildAnimal(
                        image: 'assets/images/Rabbit.png',
                        name: 'Rabbit'
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Text('Pet Mates',style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'PoppinsBold'
                ),),

                SizedBox(
                  height: 16,
                ),


                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pets.length,
                  padding: EdgeInsets.all(2),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.82, // Adjust the aspect ratio as needed
                  ),
                  itemBuilder: (context, index) {
                    return buildPetItem(pets[index],context);
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAnimal({
  required String image,
    required String name

}){
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          child: Image.asset(image),
        ),
        SizedBox(
          height: 5,
        ),
        Text(name,style: TextStyle(fontSize: 16,fontFamily: 'PoppinsBold'),),
      ],
    );
  }
}
