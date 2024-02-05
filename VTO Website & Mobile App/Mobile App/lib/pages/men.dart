import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fypapp/loginsignup/signup.dart';
import 'package:fypapp/pages/mainLanding.dart';
import 'package:fypapp/utils/multi3.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fypapp/provider/provider1.dart';
import 'package:fypapp/utils/multiText.dart';
import '../utils/forgotLink.dart';
import 'ab.dart';

class MenSection extends StatelessWidget {
  const MenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Multi3(color: Colors.white, subtitle: "Men Wearing", weight: FontWeight.normal, size: 21),
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
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
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body:Ab() ,
    );
  }
}