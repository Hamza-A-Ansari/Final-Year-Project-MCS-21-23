import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fypapp/pages/Landing.dart';
import 'package:fypapp/pages/mainLanding.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:fypapp/provider/provider1.dart';
import 'package:fypapp/utils/multiText.dart';
import 'package:http/http.dart' as http;
import '../utils/categories.dart';
import '../utils/framesDisplay.dart';
import '../utils/multi3.dart';
import '../utils/products.dart';
import '../utils/slider.dart';


class AfterLanding extends StatelessWidget {
  const AfterLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
             
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/title1.png"),
                  fit: BoxFit.cover
                  )
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                       child: ElevatedButton(
                                   onPressed: () {},
                                   child: Multi(color: Colors.white, subtitle: "Shirts", weight: FontWeight.bold, size: 16),
                                   style: ElevatedButton.styleFrom(
                                     padding: EdgeInsets.only(right: 45,left: 45,top: 20,bottom: 20),
                                     side: BorderSide(
                                       color: Colors.white,
                                       width: 2,
                                     ),
                                     backgroundColor:Colors.transparent,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(5),
                                     ),
                                   ),
                                 ),
                     ),
                     Container(child: Multi3(color: Colors.white, subtitle: "Try  before you  buy with our  virtual try-on  technology for shirts!", weight: FontWeight.normal, size: 27))
                  ],
                ),
              ),
            )
            ),
             Expanded(
            flex: 3,
            child: Container(
             
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/title2.png"),
                  fit: BoxFit.cover
                  )
              ),
               child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                       child: ElevatedButton(
                                   onPressed: () {
                                     Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Example()));
                                   },
                                   child: Multi(color: Colors.white, subtitle: "Glasses", weight: FontWeight.bold, size: 16),
                                   style: ElevatedButton.styleFrom(
                                     padding: EdgeInsets.only(right: 45,left: 45,top: 20,bottom: 20),
                                     side: BorderSide(
                                       color: Colors.white,
                                       width: 2,
                                     ),
                                     backgroundColor:Colors.transparent,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(5),
                                     ),
                                   ),
                                 ),
                     ),
                     Multi3(color: Colors.white, subtitle: "Experience glasses like never before with our virtual try-on technology!", weight: FontWeight.normal, size: 27)
                  ],
                ),
            )
            ))
        ],
      ),
    );
  }
}