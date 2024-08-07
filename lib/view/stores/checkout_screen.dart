import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_app/components/constant.dart';
import 'package:pet_app/view/stores/stores_screen.dart';

import '../../components/widget.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  bool isVisa = true;
  bool isVodafone = false;
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
                      'Checkout',
                      style: TextStyle(fontSize: 20, fontFamily: 'PoppinsBold'),
                    ),
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

                //visa
                Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        isVisa=!isVisa;
                        isVodafone=false;
                      });
                    }, icon: isVisa ? Icon(Icons.radio_button_checked,color:primaryColor,):Icon(Icons.radio_button_off_outlined)),
                    Text(
                      'Visa card',
                      style: TextStyle(fontSize: 14, fontFamily: 'PoppinsBold'),
                    ),
                  ],
                ),

                isVisa
                    ?
                Column(
                  children: [
                    customTextFormField(title: 'Card Holder Name', hintText: 'Maram Mohamed'),
                    SizedBox(height: 10,),
                    customTextFormField(title: 'Card Number', hintText: '543-5658-1569-1232'),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(child:customTextFormField(title: 'Expiry Date', hintText: '05 / 2222'),),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child:customTextFormField(title: 'CVV', hintText: '***'),),

                      ],
                    ),

                  ],
                ):
                SizedBox(height: 0,),

                SizedBox(height: 20,),


                //vodafone
                Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        isVodafone=!isVodafone;
                        isVisa=false;
                      });
                    }, icon: isVodafone ? Icon(Icons.radio_button_checked,color:primaryColor,):Icon(Icons.radio_button_off_outlined)),
                    Text(
                      'Vodafone Cash',
                      style: TextStyle(fontSize: 14, fontFamily: 'PoppinsBold'),
                    ),
                  ],
                ),
                isVodafone
                    ?
                Column(
                  children: [
                    customTextFormField(title: 'Wallet Number', hintText: '0101234567'),
                    SizedBox(height: 10,),
                    customTextFormField(title: 'PIN', hintText: '*****'),
                    SizedBox(height: 10,),
                    customTextFormField(title: 'OTP', hintText: '*****'),

                  ],
                ):
                SizedBox(height: 0,),


                SizedBox(
                  height: 40,
                ),
                customButton(title: 'Check out', function: (){

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
