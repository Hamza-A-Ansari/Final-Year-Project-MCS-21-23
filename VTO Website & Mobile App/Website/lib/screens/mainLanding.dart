import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p1/screens/landing.dart';
import 'package:p1/screens/men.dart';
import 'package:p1/utils/cate.dart';
import 'package:p1/utils/framedisplay.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';
import 'package:p1/utils/multiText.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/multi2.dart';
import '../utils/slider.dart';

class MainLanding extends StatelessWidget {
  const MainLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Row(
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
                     Container(child: Multi2(color: Colors.white, subtitle: "Try  before you  buy with our  virtual try-on  technology for shirts!", weight: FontWeight.normal, size: 27, shadowColor: Colors.blue,))
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
                                    Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => LandingPage()));
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
                     Multi2(color: Colors.white, subtitle: "Experience glasses like never before with our virtual try-on technology!", weight: FontWeight.normal, size: 27, shadowColor: Colors.blue,)
                  ],
                ),
            )
            ))
        ],
      ),
    );
  }
}