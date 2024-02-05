import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fypapp/loginsignup/login.dart';
import 'package:provider/provider.dart';

import '../afterLanding.dart';
import '../provider/provider1.dart';
import '../utils/multiText.dart';


class Initail1 extends StatelessWidget {
  const Initail1({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    return Scaffold(
      
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg2.png"),
          fit: BoxFit.cover
          )
         
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10.r)),
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
                              subtitle: "Log In",
                              weight: FontWeight.w600,
                              size: 18), // <-- Text
                           Image.asset("assets/mail.png",height: 25.h,width: 25.w,)
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        // <-- Radius
                      ),
                    ),
                    onPressed: () async {
                                          Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) =>
                                                           LogIn()
                                                      )
                                                      );
                    },
                  )),
              SizedBox(height: 20.h,),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10.r)),
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
                              subtitle: "Continue with Google",
                              weight: FontWeight.w600,
                              size: 18), // <-- Text
                          Image.asset("assets/google.png",height: 25.h,width: 25.w,)
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        // <-- Radius
                      ),
                    ),
                    onPressed: () async {
                   await Provider11.googleLogin(context);
                    },
                  )),
                  SizedBox(height: 20.h,),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10.r)),
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
                              subtitle: "Continue as guest",
                              weight: FontWeight.w600,
                              size: 18), // <-- Text
                          Image.asset("assets/user.png",height: 25.h,width: 25.w,)
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        // <-- Radius
                      ),
                    ),
                    onPressed: () async {
                       Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AfterLanding()));
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}