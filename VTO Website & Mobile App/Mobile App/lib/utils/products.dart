import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:fypapp/utils/multiText.dart';


class Products extends StatelessWidget {
  String imgAddress;
  String title;
  String price;
  Products({super.key, required this.imgAddress,required this.title,required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 170.w,
      decoration: BoxDecoration(
        color: Color(0xffCC0006),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 120.h,
              width: 170.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), 
                  ),
                ],
              
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(imgAddress),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: Column(
              
              children: [
                Container(
                  width: 149.w,
                  child: Multi(color: Colors.white, subtitle: "$title", weight: FontWeight.w700, size: 20)),
                  Multi(color: Colors.white, subtitle: "RS ${price}", weight: FontWeight.w600, size: 23)
              ],
            ),
          )
        ],
      ),
    );
  }
}