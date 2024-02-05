import 'dart:convert';
import 'package:fypapp/pages/features/onBoardingFeature/presentation/contentModel.dart';
import 'package:fypapp/pages/initial.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import '../../../../loginsignup/login.dart';
import '../../../../provider/provider1.dart';
import '../../../../utils/multi2.dart';
import '../../../../utils/multi4.dart';
import '../../../../utils/multiText.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  int activeStep = 0;
  int dotCount = 3;
  bool state = false;

  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
   

  
    return Scaffold(
      body: Container(
       
            height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/bg2.png'),
          fit: BoxFit.fill,
        ),
       
    
        ),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 68.h,
            ),
            SizedBox(
              height: 272.h,
              width: 280.w,
              child: Image(
                image: AssetImage(contents[activeStep].image),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            DotStepper(
              activeStep: activeStep,
              dotCount: dotCount,
              shape: Shape.circle,
              dotRadius: 6,
              spacing: 8,
              indicator: Indicator.worm,
              onDotTapped: (dotindex) {
                setState(() {
                  activeStep = dotindex;
                });
              },
              fixedDotDecoration: FixedDotDecoration(
                color: Color(0xffDADADA),
              ),
              indicatorDecoration: IndicatorDecoration(color: Colors.black),
            ),
            SizedBox(height: 15.h),
            Multi4(
                color: Colors.white,
                subtitle: contents[activeStep].title,
                weight: FontWeight.normal,
                size: 30),
            contents[activeStep].subtitle == ""
                ? SizedBox(
                    height: 15.h,
                  )
                : Column(
                    children: [
                      SizedBox(height: 5.h),
                      Multi4(
                          color: Colors.white,
                          subtitle: contents[activeStep].subtitle,
                          weight: FontWeight.normal,
                          size: 20),
                      SizedBox(height: 5.h),
                    ],
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Multi(
                  color: Colors.white,
                  subtitle: contents[activeStep].description,
                  weight: FontWeight.bold,
                  size: 12),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                child: activeStep > 1
                    ? Container(
                        height: 48.h,
                        width: 312.w,
                        child: state == false
                            ? ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    state = true;
                                  });
                                 
                                  setState(() {
                                    state = false;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Initail1()));
                                },
                                child: Text("Let's Start"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff1C1C1C)),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                              )))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            ElevatedButton(
                              onPressed: () async {
                                
                                setState(() {
                                  activeStep++;
                                });
                             
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(color: Color(0xff1C1C1C)),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await Future.delayed(Duration(seconds: 2));
                                setState(() {
                                  activeStep++;
                                });
                              
                              },
                              child: Text("Next"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff1C1C1C)),
                              ),
                            ),
                          ]),
              ),
            )
          ],
        )),
      ),
    );
  }
}
