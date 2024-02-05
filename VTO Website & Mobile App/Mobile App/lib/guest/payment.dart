import 'dart:collection';
import 'dart:convert';
import 'dart:ui';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import 'package:glass/glass.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../provider/provider1.dart';
import '../utils/multiText.dart';



class PaymentEdit extends StatefulWidget {
  const PaymentEdit({super.key});

  @override
  State<PaymentEdit> createState() => _PaymentEditState();
}

class _PaymentEditState extends State<PaymentEdit> {
  @override

  int _selectedValue = 1;
  String method = "cod";
  final address = TextEditingController(); 
  final phone = TextEditingController(); 
  final first = TextEditingController(); 
  final last = TextEditingController(); 
  final email = TextEditingController(); 
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
        Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;
 
var uuid = Uuid();

  // Generate a v1 (time-based) id
  var v1 = uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
         leading: GestureDetector(
            onTap: () async {
            
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
                                ),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Color.fromARGB(255, 31, 30, 30),
            Color.fromARGB(255, 54, 53, 53),
            ]
          )
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Multi(color: Colors.white, subtitle: "Basic Info", weight: FontWeight.bold, size: 21),
                      Container()
                    ],
                  ),
                  SizedBox(height: 9.h,),
                  Divider(thickness: 2,color: Colors.white,),
                  SizedBox(height: 9.h,),
                     Container(
                                padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  controller: first,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 3.w),
                                      child: Multi(color: Colors.grey, subtitle: "First Name", weight: FontWeight.bold, size: 14),
                                    ),
                                      focusColor: Color(0xff164584),
                                      border: InputBorder.none,
                              ),
                                        validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                                ),
                              ),
                   SizedBox(height: 10.h,),
                     Container(
                                padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  controller: last,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 3.w),
                                      child: Multi(color: Colors.grey, subtitle: "Last Name", weight: FontWeight.bold, size: 14),
                                    ),
                                      focusColor: Color(0xff164584),
                                      border: InputBorder.none,
                              ),
                                        validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                                ),
                              ),
                   SizedBox(height: 10.h,),
                     Container(
                                padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  controller: email,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 3.w),
                                      child: Multi(color: Colors.grey, subtitle: "Email", weight: FontWeight.bold, size: 14),
                                    ),
                                      focusColor: Color(0xff164584),
                                      border: InputBorder.none,
                              ),
                                        validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                                ),
                              ),
                     SizedBox(height: 10.h,),
                      Container(
                                padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  controller: address,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 3.w),
                                      child: Multi(color: Colors.grey, subtitle: "Address", weight: FontWeight.bold, size: 14),
                                    ),
                                      focusColor: Color(0xff164584),
                                      border: InputBorder.none,
                              ),
                                        validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                                ),
                              ),
                   SizedBox(height: 10.h,),
                     Container(
                                padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  controller: phone,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 3.w),
                                      child: Multi(color: Colors.grey, subtitle: "Phone", weight: FontWeight.bold, size: 14),
                                    ),
                                      focusColor: Color(0xff164584),
                                      border: InputBorder.none,
                              ),
                                        validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                                ),
                              ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Multi(color: Colors.white, subtitle: "Payment Method", weight: FontWeight.bold, size: 21),
                      Container()
                    ],
                  ),
                  SizedBox(height: 9.h,),
                  Divider(thickness: 2,color: Colors.white,),
                  SizedBox(height: 9.h,),
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
                                         subtitle: "Cash On Deleivery",
                                         weight: FontWeight.w600,
                                         size: 18), // <-- Text
                                     Image.asset("assets/cod2.png",height: 40.h,width: 40.w,)
                                   ],
                                 ),
                               ),
                               style: ElevatedButton.styleFrom(
                                 backgroundColor:  _selectedValue == 1 ? Colors.black : Colors.transparent,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10.r),
                                   // <-- Radius
                                 ),
                               ),
                              onPressed: () {
                       setState(() {
                         _selectedValue = 1;
                         method="cod";
                       });
                     },
                             )
                             ),
                    SizedBox(height: 10.h,),
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
                                         subtitle: "Visa card",
                                         weight: FontWeight.w600,
                                         size: 18), // <-- Text
                                     Image.asset("assets/visa.png",height: 40.h,width: 40.w,)
                                   ],
                                 ),
                               ),
                               style: ElevatedButton.styleFrom(
                                 backgroundColor:  _selectedValue == 2 ? Colors.black : Colors.transparent,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10.r),
                                   // <-- Radius
                                 ),
                               ),
                              onPressed: () {
                       setState(() {
                         _selectedValue = 2;
                          method="visa";
                       });
                     },
                             )
                             ),
                    SizedBox(height: 20.h,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Multi(
                          color: Colors.white,
                          subtitle: "Select Delievery Time",
                          weight: FontWeight.bold,
                          size: 21),
                      Container()
                    ],
                  ),
                   SizedBox(
                    height: 9.h,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  SizedBox(
                    height: 230.h,
                    width: double.infinity,
                    child: showPicker(
                    isInlinePicker: true,
                    elevation: 1,
                    value: _time,
                    onChange: onTimeChanged,
                    minuteInterval: TimePickerInterval.FIVE,
                    iosStylePicker: iosStyle,
                    minHour: 9,
                    maxHour: 21,
                    is24HrFormat: true,
                  ),
                  ),
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
                                subtitle: "Place Order",
                                weight: FontWeight.w600,
                                size: 18), // <-- Text
                            Icon(Icons.arrow_forward,color: Colors.white,)
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffCC0006),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          // <-- Radius
                        ),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                            try {
                        String uid = uuid.v4().toString().substring(0,10);
                        final FirebaseFirestore db = FirebaseFirestore.instance;
                        final orderCollectionRef = db
                            .collection("guest_orders")
                            .doc(uid);
                            
                    await   orderCollectionRef.set({
                      "first name":first.text,
                      "last name":last.text,
                      "email":email.text,
                      "phone":phone.text,
                        "address":address.text,
                        "time":_time.toString(),
                        "number":phone.text,
                        "method":method,
                        "amount":Provider11.priceSum,
                        "deleivery":"100",
                        "unique_id":"${uid}"
                       });
                       Provider11.items_in_cart!.clear();
                       Provider11.lat=null;
                       Provider11.lon=null;
                       Provider11.time=null;
                       Provider11.priceSum=0;
                       address.clear();
                       phone.clear();
                       first.clear();
                       last.clear();
                       email.clear();
                       
                       Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Congratulations, your Order Has Been Placed',
        title: 'Congratulations',
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Done',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ],
      );
                      
                  } catch (e) {
                    print("${e} error is");
                  }
                        }
                  //        Navigator.push(
                  // context,
                  // PageRouteBuilder(
                  //     pageBuilder: (context, animation, secondaryAnimation) =>
                  //         Example()));
                      },
                    )
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}