import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:http/http.dart' as http;

import '../provider/provider1.dart';
import '../utils/categories.dart';
import '../utils/multi2.dart';
import '../utils/multi3.dart';
import '../utils/multiText.dart';
import '../utils/products.dart';
import '../utils/special.dart';

import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

import 'initial.dart';

class Favourities extends StatelessWidget {
  const Favourities({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        
        body: Provider11.name!=null? Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 31, 30, 30),
            Color.fromARGB(255, 54, 53, 53),
          ]),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3), //New
              blurRadius: 25.0,
              spreadRadius: 0.1,
              offset: const Offset(
                -5.0,
                5.0,
              ),
            )
          ],
        ),
        child: Column(
          children: [
            Multi3(color: Colors.white, subtitle: "Your Favourities", weight: FontWeight.normal, size: 26),
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('likes/${Provider11.uid}/likes')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                   if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData ) {
             return Padding(
               padding:  EdgeInsets.symmetric(horizontal: 10.w),
               child: Container(
                      child: ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                            return Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                            child: GestureDetector(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30.w, right: 50.w),
                                    child: Container(
                                      height: 70.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.r),
                                        gradient: LinearGradient(colors: [
                                          Color.fromARGB(255, 31, 30, 30),
                                          Color.fromARGB(255, 54, 53, 53),
                                        ]),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white.withOpacity(0.3), //New
                                            blurRadius: 2.0,
                                            spreadRadius: 2,
                                            offset: const Offset(
                                             0,0
                                            ),
                                          )
                                        ],
                                      ),
                                        child: Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                
                                                  Multi2(color: Colors.white, subtitle: data['title'], weight: FontWeight.normal, size: 12),
                                                  Multi(color: Colors.grey, subtitle: "Rs ${data['price']}", weight: FontWeight.bold, size: 20),
                                                ],
                                              ),
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 0.h),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          
                                          height: 60.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10.r),
                                            image: DecorationImage(
                                              image: AssetImage(data['imgAddress']),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: 50.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.r),
                                            color: Colors.transparent
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 20.h,
                                                width: 60.w,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white
                                                            .withOpacity(0.3), //New
                                                        blurRadius: 1.0,
                                                        spreadRadius: 0.1,
                                                        offset: const Offset(
                                                          0,0
                                                        ),
                                                      )
                                                    ],
                                                    gradient: LinearGradient(colors: [
                                                      Color.fromARGB(255, 31, 30, 30),
                                                      Color.fromARGB(255, 54, 53, 53),
                                                    ])),
                                                    child: Multi(color: Colors.white, subtitle: data['stock'], weight: FontWeight.bold, size: 10),
                                              ),
                                              Container(
                                                height: 20.h,
                                                width: 60.w,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white
                                                            .withOpacity(0.3), //New
                                                        blurRadius: 1.0,
                                                        spreadRadius: 0.1,
                                                        offset: const Offset(
                                                          0,0)
                                                      )
                                                    ],
                                                    gradient: LinearGradient(colors: [
                                                      Color.fromARGB(255, 31, 30, 30),
                                                      Color.fromARGB(255, 54, 53, 53),
                                                    ])),
                                                    child: Multi(color: Colors.white, subtitle: data['tax'], weight: FontWeight.bold, size: 10),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
             );
        }

        if (snapshot.connectionState == ConnectionState.done) {
             return Container(
                    child: ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                          return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                          child: GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w, right: 50.w),
                                  child: Container(
                                    height: 70.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      gradient: LinearGradient(colors: [
                                        Color.fromARGB(255, 31, 30, 30),
                                        Color.fromARGB(255, 54, 53, 53),
                                      ]),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.3), //New
                                          blurRadius: 2.0,
                                          spreadRadius: 2,
                                          offset: const Offset(
                                           0,0
                                          ),
                                        )
                                      ],
                                    ),
                                      child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                              
                                                Multi2(color: Colors.white, subtitle: data['title'], weight: FontWeight.normal, size: 12),
                                                Multi(color: Colors.grey, subtitle: "Rs ${data['price']}", weight: FontWeight.bold, size: 20),
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.h),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        height: 60.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10.r),
                                          image: DecorationImage(
                                            image: AssetImage(data['imgAddress']),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h),
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: 50.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: Colors.transparent
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 20.h,
                                              width: 60.w,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.3), //New
                                                      blurRadius: 1.0,
                                                      spreadRadius: 0.1,
                                                      offset: const Offset(
                                                        0,0
                                                      ),
                                                    )
                                                  ],
                                                  gradient: LinearGradient(colors: [
                                                    Color.fromARGB(255, 31, 30, 30),
                                                    Color.fromARGB(255, 54, 53, 53),
                                                  ])),
                                                  child: Multi(color: Colors.white, subtitle: data['stock'], weight: FontWeight.bold, size: 10),
                                            ),
                                            Container(
                                              height: 20.h,
                                              width: 60.w,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.3), //New
                                                      blurRadius: 1.0,
                                                      spreadRadius: 0.1,
                                                      offset: const Offset(
                                                        0,0)
                                                    )
                                                  ],
                                                  gradient: LinearGradient(colors: [
                                                    Color.fromARGB(255, 31, 30, 30),
                                                    Color.fromARGB(255, 54, 53, 53),
                                                  ])),
                                                  child: Multi(color: Colors.white, subtitle: data['tax'], weight: FontWeight.bold, size: 10),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
        }

        return CircularProgressIndicator(color: Colors.white,);

              
                  
                  }
                
              ),
            ),
          ],
        ),
      ):Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg2.png"),
            fit: BoxFit.fitWidth
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Multi2(color: Colors.white, subtitle: "Login to see favourities", weight: FontWeight.bold, size: 25),
              SizedBox(height: 10.h,),
              ElevatedButton(
                                onPressed: () async {
                                 
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Initail1()));
                                },
                                child: Text("Log in"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff1C1C1C)),
                                ),
                              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}


// Padding(
//                         padding: EdgeInsets.all(12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                                 flex: 1,
//                                 child: Container(
//                                   height: 50.h,
//                                   width: 50.w,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10.r),
//                                     image: DecorationImage(    
//                                       image:
//                                           NetworkImage(data['imgAddress']),
//                                           fit: BoxFit.fill,
//                                     ),
                                    
//                                   ),
//                                 )),
//                                 Expanded(
//                                 flex: 3,
//                                 child: Padding(
//                                   padding:  EdgeInsets.only(left: 20.w),
//                                   child: Container(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
                                      
//                                         Multi(color: Colors.grey, subtitle: data['title'], weight: FontWeight.bold, size: 12),
//                                         Multi(color: Colors.grey, subtitle: "Rs ${data['price']}", weight: FontWeight.bold, size: 12),
//                                       ],
//                                     ),
//                                   ),
//                                 )),
//                                 Expanded(
//                                   flex: 2,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         color: Colors.white,
//                                         child: Multi(color: Colors.black, subtitle: data['tax'], weight: FontWeight.bold, size: 10)),
//                                       Container(
//                                         color: Colors.white,
//                                         child: Multi(color: Colors.black, subtitle: data['stock'], weight: FontWeight.bold, size: 10)),
//                                     ],
//                                   )
//                                   )
//                           ],
//                         ),
//                       ),