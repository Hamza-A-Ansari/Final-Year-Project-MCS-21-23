import 'dart:convert';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fypapp/pages/cartList.dart';
import 'package:fypapp/pages/display.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'package:http/http.dart' as http;

import '../provider/provider1.dart';
import '../utils/categories.dart';

import '../utils/multi2.dart';
import '../utils/multiText.dart';
import '../utils/para.dart';
import '../utils/products.dart';
import '../utils/shadowText.dart';
import '../utils/special.dart';

import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';


class DisplayProduct3 extends StatefulWidget {
  int? id;
  String? title;
  String? price;
  String? stock;
  String? tax;
  String? imgAddress;
  String? colors;
  String gender;
  String?shape;
  String? size;

  DisplayProduct3(
      {super.key,
      required this.id,
      required this.imgAddress,
      required this.title,
      required this.price,
      required this.stock,
      required this.tax,
      required this.colors,
      required this.count,
      required this.gender,required this.shape,required this.size
      });

  int count = 1;

  @override
  State<DisplayProduct3> createState() => _DisplayProduct3State();
}

class _DisplayProduct3State extends State<DisplayProduct3> {
   String? text;
   bool? isSelected;
  dynamic _selectedOption;
  int count = 1;
  @override


  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: false);
    // addItem() async {
      
    //   Provider11.items_in_cart!.add(CartItems(
    //     widget.id!,
    //     widget.imgAddress.toString(),
    //     widget.title.toString(),
    //     widget.title.toString(),
    //     int.parse(widget.price.toString()) * widget.count,
    //     widget.count,
    //     int.parse(widget.price.toString()),
    //   ));
    //   Provider11.options.clear();
    //   Provider11.prices1.clear();
    //   setState(() {
    //     selectedValue = null;
    //     price1 = null;
    //   });
    //   Provider11.increamentCart();
    //   if (Provider11.myDictionary?.isEmpty == false) {
    //     Provider11.myDictionary = {};

    //     Navigator.of(context).pop();
    //   } else {
    //     Navigator.of(context).pop();
    //   }
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 31, 30, 30),
            Color.fromARGB(255, 23, 23, 23),
          ])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    
                    width: double.infinity,
                    height: 350.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      image: DecorationImage(
                        image: AssetImage(widget.imgAddress.toString()),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color.fromARGB(255, 31, 30, 30),
                                      Color.fromARGB(255, 54, 53, 53),
                                    ]),
                                    borderRadius: BorderRadius.circular(5.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 54, 53, 53),
                                        offset: const Offset(0, 0),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                       Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: ()async{
      final FirebaseFirestore db = FirebaseFirestore.instance;
    await  db.collection("likes").doc(Provider11.uid)..collection("likes")
          .doc().set({
        "title":widget.title,
        "price":widget.price,
        "stock":widget.stock,
        "tax":widget.tax,
        "imgAddress":widget.imgAddress
      });
        Fluttertoast.showToast(
          msg: "Add to Favorities",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(255, 54, 53, 53),
                                            offset: const Offset(0, 0),
                                            blurRadius: 10.0,
                                            spreadRadius: 2.0,
                                          ), //BoxShadow
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ), //BoxShadow
                                        ],
                                        gradient: LinearGradient(colors: [
                                          Color.fromARGB(255, 31, 30, 30),
                                          Color.fromARGB(255, 54, 53, 53),
                                        ]),
                                        borderRadius: BorderRadius.circular(5.r)),
                                    child: Center(
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Color(0xffCC0006).withOpacity(0.3),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      // color: Colors.transparent.withOpacity(0.2),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ShadowText(
                                                      color: Colors.white,
                                                      shadowColor: Colors.black,
                                                      subtitle:
                                                          "${widget.title}",
                                                      weight: FontWeight.bold,
                                                      size: 18),
                                                  Multi(
                                                      color: Colors.black,
                                                      subtitle:
                                                          "Rs ${widget.price}",
                                                      weight: FontWeight.w600,
                                                      size: 21)
                                                ],
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 30.h,
                                                    width: 90.w,
                                                    child: Center(
                                                      child: Multi(
                                                          color: Colors.white,
                                                          subtitle:
                                                              "${widget.stock}",
                                                          weight:
                                                              FontWeight.bold,
                                                          size: 10),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Color.fromARGB(255,
                                                                31, 30, 30),
                                                            Color.fromARGB(255,
                                                                54, 53, 53),
                                                            Color.fromARGB(255,
                                                                31, 30, 30),
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black,
                                                          offset: const Offset(
                                                              0, 0),
                                                          blurRadius: 10.0,
                                                          spreadRadius: 2.0,
                                                        ), //BoxShadow
                                                        BoxShadow(
                                                          color: Colors.white,
                                                          offset: const Offset(
                                                              0.0, 0.0),
                                                          blurRadius: 0.0,
                                                          spreadRadius: 0.0,
                                                        ), //BoxShadow
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30.h,
                                                    width: 90.w,
                                                    child: Center(
                                                      child: Multi(
                                                          color: Colors.white,
                                                          subtitle:
                                                              "${widget.tax}",
                                                          weight:
                                                              FontWeight.bold,
                                                          size: 10),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Color.fromARGB(255,
                                                                31, 30, 30),
                                                            Color.fromARGB(255,
                                                                54, 53, 53),
                                                            Color.fromARGB(255,
                                                                31, 30, 30),
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black,
                                                          offset: const Offset(
                                                              0, 0),
                                                          blurRadius: 10.0,
                                                          spreadRadius: 2.0,
                                                        ), //BoxShadow
                                                        BoxShadow(
                                                          color: Colors.white,
                                                          offset: const Offset(
                                                              0.0, 0.0),
                                                          blurRadius: 0.0,
                                                          spreadRadius: 0.0,
                                                        ), //BoxShadow
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Multi(
                          color: Colors.white,
                          subtitle: "Description",
                          weight: FontWeight.bold,
                          size: 12),
                      Container()
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    width: double.infinity,
                    child: Para(
                        color: Colors.white,
                        subtitle:
                            "In this example, we're using a Stack widget to place the image and the frosted container on top of each other. The Image.network widget loads the image and fills the available space using the fit: BoxFit.cover property.",
                        weight: FontWeight.normal,
                        size: 11),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                 Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        height: 400.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                           boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: const Offset(
                                        0,
                                        0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 1.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ), //BoxShadow
                                  ],
                        ),
                    
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "DIMENSIONS", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "52 × 19 × 145 mm", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "COLORS", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "${widget.colors}", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "FEATURE", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "No Spring", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "GENDER", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "${widget.gender}", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "MATERIAL", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "	Acetate", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "RIM", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "Full Rim", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "SHAPE", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "${widget.shape}", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "SIZE", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "${widget.size}", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                    
                            ],
                          ),
                        ),
                      ),
                    ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Multi(
                          color: Colors.white,
                          subtitle: "Swipe to increase quantity:",
                          weight: FontWeight.bold,
                          size: 12),
                      Container()
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // height: 100.h,
                        width: 150.w,
                        child: StepperSwipe(
                          initialValue: 1,
                          speedTransitionLimitCount: 3,
                          firstIncrementDuration: Duration(milliseconds: 300),
                          secondIncrementDuration: Duration(milliseconds: 100),
                          direction: Axis.horizontal,
                          dragButtonColor: Color(0xffCC0006),
                          withSpring: true,
                          maxValue: 50,
                          minValue: 1,
                          withFastCount: true,
                          stepperValue: widget.count,
                          onChanged: (int val) => setState(() {
                            widget.count = val;
                          }),
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                      height: 50.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Multi(
                                  color: Colors.white,
                                  subtitle: "Add to Cart",
                                  weight: FontWeight.w600,
                                  size: 18), // <-- Text
                              Icon(
                                // <-- Icon
                                Icons.arrow_forward,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffCC0006),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.r), // <-- Radius
                          ),
                        ),
                        onPressed: () async {
                          Provider11.items_in_cart!.add(CartItems(1, widget.imgAddress.toString(), widget.title.toString(), widget.size.toString(), int.parse(widget.price.toString()), count, int.parse(widget.price.toString())));
                          // await Future.delayed(Duration(seconds: 2));
                          Provider11.increamentCart();
                               Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        CartList()));
                        },
                      )),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
