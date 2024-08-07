import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_app/components/constant.dart';
import 'package:pet_app/view/stores/checkout_screen.dart';
import 'package:pet_app/view/stores/stores_screen.dart';

import '../../components/widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                      width: 20,
                    ),
                    Text(
                      'Cart',
                      style: TextStyle(fontSize: 20, fontFamily: 'PoppinsBold'),
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline,color: Colors.red,))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: primaryColor, size: 15),
                    Text(
                      '124 Nile Valley Street,Cairo, Egypt ',
                      style: TextStyle(
                        fontSize: 11,
                        color: grayTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),

                Container(
                  height: Products.length*150,
                  child: ListView.separated(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildProductItem(Products[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: Products.length),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Sub-Total: ',
                              style: TextStyle(
                                fontSize: 14,
                                color: grayTextColor

                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              '712 EGP',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: grayTextColor

                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(

                          children: [
                            Text(
                              'Shipping Fees',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: grayTextColor

                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              '50 EGP',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: grayTextColor

                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 221,
                          height: 1,
                          color: primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(

                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                  fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              '762 EGP',
                              style: TextStyle(
                                  fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                customButton(title: 'Check out', function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutScreen()));
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

  Widget buildProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 164,
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
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 85,
                child: Image.asset(product.imageUrl),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
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
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: primaryColor,
                        width: 1.5
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove,size: 12,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('1'),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: primaryColor,
                          width: 1.5
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,size: 12,
                        color: primaryColor,
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

}
