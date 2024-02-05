import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fypapp/utils/shadowText.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'package:glass/glass.dart';
import 'package:intl/intl.dart';

import 'multiText.dart';


class Special extends StatelessWidget {
  String imgAddress;
  String title;
  String price;
  Special(
      {super.key,
      required this.imgAddress,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    NumberFormat priceFormat = NumberFormat.currency(
      symbol: 'Rs ', 
      decimalDigits: 0, 
    );
    return Container(
      height: 255.h,
      width: 100.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 31, 30, 30),
            Color.fromARGB(255, 54, 53, 53),
          ]
          ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 140.h,
              width: 170.w,
              decoration: BoxDecoration(
                boxShadow: [
                 
                ],
                borderRadius: BorderRadius.circular(20.r),
              
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                       borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: AssetImage(imgAddress),
                    fit: BoxFit.contain,
                  ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h,),
          
          Positioned(
            bottom: 10,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 122.w,
                    child: ShadowText(
                      shadowColor: Colors.black,
                      color: Colors.white,
                        subtitle: "${title}",
                        weight: FontWeight.w700,
                        size: 12
                       )),
                  SizedBox(
                      height: 5.h,
                    ),
                
                    Container(
                      width: 122.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,         
                          children: [
                            Multi(
                                color: Colors.white,
                                subtitle: "${priceFormat.format(double.parse(price))}",
                                weight: FontWeight.w600,
                                size: 15),
                            
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: Colors.white
                              ),
                              child: Center(child: Icon(Icons.add,color: Color.fromARGB(255, 31, 30, 30),size: 20,)),
                            )
                          ],
                         ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
