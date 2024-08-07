import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_app/components/constant.dart';
import 'package:pet_app/view/stores/stores_screen.dart';

import '../../components/widget.dart';

class StoresDetailsScreen extends StatefulWidget {
  final String image;
  const StoresDetailsScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<StoresDetailsScreen> createState() => _StoresDetailsScreenState();
}

class _StoresDetailsScreenState extends State<StoresDetailsScreen> {
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
      storeName: 'Happy Pets Market',
      price: '250',
      descount: '212',
      imageUrl: 'assets/images/p2.png',
      offpresent: '15',
    ),
    Product(
      name: 'Fruity Snacks',
      storeName: 'Happy Pets Market',
      price: '250',
      descount: '212',
      imageUrl: 'assets/images/p3.png',
      offpresent: '15',
    ),
    // Add more Products here
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
                      width: 5,
                    ),
                    Container(
                      width: 35,
                      height: 29,
                      child: Image.asset(widget.image),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Happy pets Market',
                      style: TextStyle(fontSize: 20, fontFamily: 'PoppinsBold'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChooseType(name: 'Dogs'),
                    ChooseType(name: 'Cat'),
                    ChooseType(name: 'Fish'),
                    ChooseType(name: 'Bird'),
                    ChooseType(name: 'Turtle'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Dog Food',
                  style: TextStyle(fontSize: 18, fontFamily: 'PoppinsBold'),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 210,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildProductItem(Products[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: Products.length),
                ),
                SizedBox(height: 25),
                Text(
                  'Dog Supplies',
                  style: TextStyle(fontSize: 18, fontFamily: 'PoppinsBold'),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 210,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildProductItem(Products[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: Products.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
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
                'srore: ' + product.storeName,
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
                        product.price + ' EGP',
                        style: TextStyle(
                          fontSize: 10,
                          color: grayTextColor,
                          decoration: TextDecoration
                              .lineThrough, // Strike-through for old price
                        ),
                      ),
                      Text(
                        product.descount + ' EGP',
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
                      child: Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
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

//initialization
  String selectedType = 'Dogs';

  Widget ChooseType({required String name}) {
    bool isSelected = selectedType == name; // Check if this animal type is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = name;
        });
      },
      child: Container(
        width: 61,
        height: 37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? secondColor : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25), // Shadow color
                blurRadius: 4, // Softening the shadow
                spreadRadius: 0.5, // Extending the shadow
                offset: Offset(0, 0), // No offset to center the shadow
              ),
            ],
            border: Border.all(
                color: isSelected ? Colors.black : Colors.transparent)),
        child: Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
