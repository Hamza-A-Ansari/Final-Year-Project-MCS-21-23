import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:fypapp/provider/provider1.dart';
import 'package:fypapp/utils/multiText.dart';
import 'package:http/http.dart' as http;
import '../utils/categories.dart';
import '../utils/framesDisplay.dart';
import '../utils/multi2.dart';
import '../utils/products.dart';
import '../utils/slider.dart';

class DisplayProduct extends StatefulWidget {
  DisplayProduct({
    super.key,
  });

  @override
  State<DisplayProduct> createState() => _DisplayProductState();
}

String? selectedValue;
String? price1;
int count = 1;

class _DisplayProductState extends State<DisplayProduct> {
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);

    // String? price2 = widget.price;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () async {
              Navigator.of(context).pop();
            },
            child: AvatarGlow(
              endRadius: 60.0,
              glowColor: Colors.red,
              child: Material(
                // Replace this child with your own
                elevation: 8.0,
                shadowColor: Colors.red,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Image.asset(
                    'assets/arrow_back.png',
                    height: 40,
                  ),
                  radius: 30.0,
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: AvatarGlow(
                endRadius: 60.0,
                glowColor: Colors.red,
                child: Material(
                  // Replace this child with your own
                  shadowColor: Colors.red,
                  elevation: 8.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Image.asset(
                      'assets/share.png',
                      height: 40,
                    ),
                    radius: 30.0,
                  ),
                ),
              ),
            )
          ],
          title: Text("Frame 1"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 250.h,
                            decoration: BoxDecoration(
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    Colors.white,
                                    Color(0xffCC0006)
                                  ]),
                                  width: 8,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                gradient: new RadialGradient(
                                  colors: [
                                    Color(0xffaaffa9),
                                    Color(0xff11ffbd)
                                    // Color(0xffF4E2D8),
                                    // Color(0xffBA5370),
                                  ],
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/men/round/Full Metal Frame 1035.png"),
                                  fit: BoxFit.contain,
                                ),
                                shape: BoxShape.circle),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 80.w,
                            left: 80.w,
                            child: Container(
                              height: 40.h,
                              width: 80.w,
                              decoration: BoxDecoration(
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
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(colors: [
                                  Color(0xffCC0006),
                                  Color.fromARGB(255, 206, 39, 45),
                                  Color(0xffCC0006)
                                ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: Colors.transparent,
                                    child: IconButton(
                                        disabledColor: Colors.grey,
                                        onPressed: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 25,
                                          weight: 40,
                                        )),
                                  ),
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: Colors.white,
                                    child: Multi(
                                        color: Color(0xffCC0006),
                                        subtitle: "$count",
                                        weight: FontWeight.bold,
                                        size: 21),
                                  ),
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: Colors.transparent,
                                    child: IconButton(
                                        onPressed: () {
                                          if (count == 1) {
                                            setState(() {
                                              count;
                                            });
                                          } else {
                                            setState(() {
                                              count--;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 25,
                                          weight: 40,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Multi(
                        color: Color(0xffCC0006),
                        subtitle: "Full Steel Frame",
                        weight: FontWeight.w700,
                        size: 35),
                    Multi(
                        color: Colors.black,
                        subtitle: "\$200",
                        weight: FontWeight.w500,
                        size: 25),
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
                                  Multi2(color: Colors.black, subtitle: "Black, Tortoise", weight: FontWeight.bold, size: 16)
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
                                  Multi2(color: Colors.black, subtitle: "Men, Women", weight: FontWeight.bold, size: 16)
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
                                  Multi2(color: Colors.black, subtitle: "Round", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Multi2(color: Colors.black, subtitle: "SIZE", weight: FontWeight.bold, size: 16),
                                  Multi2(color: Colors.black, subtitle: "Medium", weight: FontWeight.bold, size: 16)
                                ],
                              ),
                    
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
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
                            child: Center(
                              child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/date.png",height: 30.h,width: 30.w,),
                                  SizedBox(width: 4.w,),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Multi(
                                          color: Colors.black,
                                          subtitle: "15-20 days",
                                          weight: FontWeight.bold,
                                          size: 12),
                                      SizedBox(height: 2.h,),
                                      Multi(
                                          color: Colors.black,
                                          subtitle: "delievery time",
                                          weight: FontWeight.normal,
                                          size: 12),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
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
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/return.png",height: 30.h,width: 30.w,),
                                  SizedBox(width: 4.w,),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Multi(
                                          color: Colors.black,
                                          subtitle: "Return",
                                          weight: FontWeight.bold,
                                          size: 12),
                                      SizedBox(height: 2.h,),
                                      Multi(
                                          color: Colors.black,
                                          subtitle: "returnable",
                                          weight: FontWeight.normal,
                                          size: 12),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: 60.h,
                          decoration: BoxDecoration(
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
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Color(0xffCC0006),
                              Color.fromARGB(255, 206, 39, 45),
                              Color(0xffCC0006)
                            ]),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Image.asset("assets/cart.png",
                                    height: 40.h, width: 40.w),
                              ),
                              Multi(
                                  color: Colors.white,
                                  subtitle: "Add to cart",
                                  weight: FontWeight.w700,
                                  size: 21),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromARGB(255, 207, 105, 105),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromARGB(255, 184, 124, 124),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromARGB(255, 141, 85, 85),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
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

class NumberFormat {}
