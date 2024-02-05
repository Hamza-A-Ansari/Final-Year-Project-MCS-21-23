import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:fypapp/utils/multiText.dart';

class CategoryData extends StatelessWidget {
  String imgAddress;
  Color color1;
  String title;
  CategoryData(
      {super.key,
      required this.imgAddress,
      required this.color1,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: color1,
              image: DecorationImage(
                image: AssetImage(imgAddress),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 5.h,),
          Multi(color: Colors.black, subtitle: title, weight: FontWeight.bold, size: 12)
        ],
      ),
    );
  }
}