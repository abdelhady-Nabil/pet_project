import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_app/components/widget.dart';
import 'package:pet_app/view/stores/cart_screen.dart';
import 'package:pet_app/view/stores/stores_details_screen.dart';


import '../../components/constant.dart';

class Product {
  final String name;
  final String storeName;
  final String price;
  final String descount;
  final String imageUrl;
  final String offpresent;

  Product({required this.name, required this.storeName, required this.price, required this.descount, required this.imageUrl, required this.offpresent});
}

class Store {
  final String imageUrl;

  Store({ required this.imageUrl});
}



class StoresScreen extends StatefulWidget {
  StoresScreen({Key? key}) : super(key: key);

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {

  final List<Product> Products = [
    Product(
      name: 'Fruity Snacks',
      storeName: 'Happy Pets Market',
      price: '250',
      descount: '212',
      imageUrl: 'assets/images/p1.png',
      offpresent: '15',
    ),
    Product(
      name: 'Fruity Snacks',
      storeName: 'Pet Essentials',
      price: '250',
      descount: '212',
      imageUrl: 'assets/images/p2.png',
      offpresent: '15',
    ),
    Product(
      name: 'Fruity Snacks',
      storeName: 'The Pet Pantry',
      price: '250',
      descount: '212',
      imageUrl: 'assets/images/p3.png',
      offpresent: '15',
    ),
    // Add more Products here
  ];

  final List<Store> Stores = [
    Store(
      imageUrl: 'assets/images/s1.png',
    ),
    Store(
      imageUrl: 'assets/images/s2.png',
    ),
    Store(
      imageUrl: 'assets/images/s3.png',
    ),
    // Add more Products here
  ];

  Widget buildProductItem(Product product) {
    return Container(
      width: 164,
      height: 190,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 90,
              child: Image.asset(product.imageUrl),
            ),
            SizedBox(height: 5),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'PoppinsBold',
              ),
            ),
            SizedBox(height: 5),
            Text(
              'srore: '+product.storeName,
              style: TextStyle(
                fontSize: 10,
                color: grayTextColor,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      product.price+' EGP',

                      style: TextStyle(
                        fontSize: 10,
                        color: grayTextColor,
                        decoration: TextDecoration.lineThrough, // Strike-through for old price

                      ),
                    ),
                    Text(
                      product.descount+' EGP',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'PoppinsBold',
                      ),
                    ),
                  ],
                ),
               Spacer(),
                Container(
                  width: 81,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text('Add to cart',style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                    ),),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }

  Widget buildStoreItem(Store store) {
    return Container(
      width: 164,
      height: 190,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 112,
              child: Image.asset(store.imageUrl),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StoresDetailsScreen(
                  image:store.imageUrl ,
                )));
              },
              child: Container(
                width: double.infinity,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                child: Center(
                  child: Text('Go to store',style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                  ),),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }


  bool isOffer = true;

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

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/images/cart.png'),
                      ),
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

                //Offers and stores
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isOffer=true;
                          });
                        },
                        child: Container(
                          height: 37,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(255, 219, 229, 1),
                            border: Border.all(
                              color: isOffer ? Colors.black :Colors.transparent
                            )
                          ),
                          child: Center(
                            child: Text('Offers',style: TextStyle(
                              fontSize: 16
                            ),),
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
                          setState(() {
                            isOffer=false;
                          });
                        },
                        child: Container(
                          height: 37,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(255, 246, 210, 1),
                              border: Border.all(
                                  color: !isOffer ? Colors.black :Colors.transparent
                              )
                          ),
                          child: Center(
                            child: Text('Stores',style: TextStyle(
                                fontSize: 16
                            ),),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                isOffer?

                //offers
                Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Products.length,
                      padding: EdgeInsets.all(2),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.82, // Adjust the aspect ratio as needed
                      ),
                      itemBuilder: (context, index) {
                        return buildProductItem(Products[index]);
                      },
                    ),
                  ],
                )
                    :
                //stores
                Column(
                  children: [

                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Stores.length,
                      padding: EdgeInsets.all(2),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.82, // Adjust the aspect ratio as needed
                      ),
                      itemBuilder: (context, index) {
                        return buildStoreItem(Stores[index]);
                      },
                    ),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
