import 'dart:collection';
import 'dart:convert';
import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fypapp/nonguest/addressLoc.dart';
import 'package:fypapp/nonguest/change.dart';
import 'package:fypapp/pages/display.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';

import 'package:glass/glass.dart';
import 'package:intl/intl.dart';

import '../pages/cartList.dart';
import '../pages/mainLanding.dart';
import '../provider/provider1.dart';
import '../utils/multiText.dart';
import '../utils/udelinedMulti.dart';

class NDelievery extends StatefulWidget {
  const NDelievery({super.key});

  @override
  State<NDelievery> createState() => _NDelieveryState();
}

class _NDelieveryState extends State<NDelievery> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController street = TextEditingController();
  TextEditingController addres = TextEditingController();
  TextEditingController nearby = TextEditingController();
  TextEditingController number = TextEditingController();
    int _selectedValue = 1;
    String? method = "cod";
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
        Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;
 

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }
    _getCurrentLocation() async {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Provider11.lat = position.latitude;
      Provider11.lon = position.longitude;
      Provider11.address="LatLng(${Provider11.lat},${Provider11.lon})";
    }

    bool state = false;
    AddressChoice() async {
      Dialogs.materialDialog(
          msg: 'Do you want to add Current Location?',
          color: Colors.white,
          context: context,
          actions: [
            IconsOutlineButton(
              onPressed: () async {
                setState(() {
                  state = true;
                });
                await _getCurrentLocation();
                await Future.delayed(Duration(seconds: 5));
                await Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LocAddress(
                              lat: Provider11.lat,
                              lon: Provider11.lon,
                            )));

                setState(() {
                  state = false;
                });
                
              },
              text: 'Yes',
              iconData: Icons.check,
              textStyle: TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {
                Dialogs.materialDialog(
                    msg: 'Write your Complete Address Here ',
                    color: Colors.white,
                    context: context,
                    actions: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                                controller: addres,
                                cursorColor: Color(0xff2032EB),
                                decoration: InputDecoration(
                                  hintText: "Enter your Address",
                                  helperStyle: TextStyle(fontSize: 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                controller: street,
                                cursorColor: Color(0xff2032EB),
                                decoration: InputDecoration(
                                  hintText: "Street Number",
                                  helperStyle: TextStyle(fontSize: 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                controller: nearby,
                                cursorColor: Color(0xff2032EB),
                                decoration: InputDecoration(
                                  hintText: "Nearby Places",
                                  helperStyle: TextStyle(fontSize: 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                           state==false? IconsButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    state=true;
                                  });
                                  Provider11.address = addres.text;
                                  await Future.delayed(Duration(seconds: 3));
                                  setState(() {
                                    state=false;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              super.widget));
                                }
                              },
                              text: 'Ok',
                              iconData: Icons.check_box,
                              color: Colors.red,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ):CircularProgressIndicator(color: Colors.red,),
                          ],
                        ),
                      )
                    ]);
              },
              text: 'No',
              iconData: Icons.cancel_outlined,
              color: Colors.red,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
    }



    numberSel(){
                Dialogs.materialDialog(
                    msg: 'Write your Complete Address Here ',
                    color: Colors.white,
                    context: context,
                    actions: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                                controller: number,
                                cursorColor: Color(0xff2032EB),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(11),
                                    ],
                                decoration: InputDecoration(
                                  hintText: "Enter your Number",
                                  helperStyle: TextStyle(fontSize: 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                           
                           state==false? IconsButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    state=true;
                                  });
                                  Provider11.phone = number.text;
                                  await Future.delayed(Duration(seconds: 3));
                                  setState(() {
                                    state=false;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              super.widget));
                                }
                              },
                              text: 'Ok',
                              iconData: Icons.check_box,
                              color: Colors.red,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ):CircularProgressIndicator(color: Colors.red,),
                          ],
                        ),
                      )
                    ]);
    }

        paymentMethod(){
       
                Dialogs.materialDialog(
                    msg: 'Select Your Payment Method',
                    color: Colors.white,
                    context: context,
                    actions: [
                      Column(
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
                                subtitle: "Cash On Deleivery",
                                weight: FontWeight.w600,
                                size: 18), // <-- Text
                            Image.asset(
                              "assets/cod2.png",
                              height: 40.h,
                              width: 40.w,
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedValue == 1
                            ? Colors.black
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedValue = 1;
                        });
                      },
                    )),
                SizedBox(
                  height: 10.h,
                ),
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
                            Image.asset(
                              "assets/visa.png",
                              height: 40.h,
                              width: 40.w,
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedValue == 2
                            ? Colors.black
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedValue = 2;
                        });
                      },
                    )),
                        ],
                      )
                    ]);}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () async {},
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 31, 30, 30),
          Color.fromARGB(255, 54, 53, 53),
        ])),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Multi(
                        color: Colors.white,
                        subtitle: "Delievery",
                        weight: FontWeight.bold,
                        size: 21),
                    Container()
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Multi(
                        color: Colors.white,
                        subtitle: "Deliever To",
                        weight: FontWeight.bold,
                        size: 12),
                    Container()
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 27.r,
                      backgroundColor: Colors.white,
                      backgroundImage: Provider11.imgAddress == null
                          ? AssetImage("assets/user.png")
                          : AssetImage(Provider11.imgAddress.toString()),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Multi(
                            color: Colors.white,
                            subtitle: "${Provider11.name}",
                            weight: FontWeight.bold,
                            size: 12),
                        Multi(
                            color: Colors.grey,
                            subtitle: "${Provider11.gmail}",
                            weight: FontWeight.bold,
                            size: 12),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Multi(
                        color: Colors.white,
                        subtitle: "Details",
                        weight: FontWeight.bold,
                        size: 12),
                    GestureDetector(
                        onTap: () async {},
                        child: Multi(
                            color: Colors.red,
                            subtitle: "",
                            weight: FontWeight.bold,
                            size: 12))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/loc.png",
                              height: 25.h,
                              width: 25.w,
                            )),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Multi(
                                color: Colors.white,
                                subtitle: "Deleivery Address",
                                weight: FontWeight.bold,
                                size: 12),
                            Container(
                                width: 250.w,
                                child: Multi(
                                    color: Colors.grey,
                                    subtitle: "${Provider11.address}",
                                    weight: FontWeight.normal,
                                    size: 12)),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () async {
                          AddressChoice();
                        },
                        child: UndeLinedMulti(
                            color: Color(0xffCC0006),
                            subtitle: "add",
                            weight: FontWeight.bold,
                            size: 12))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/time.png",
                              height: 25.h,
                              width: 25.w,
                            )),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Multi(
                                color: Colors.white,
                                subtitle: "Deleivery Time",
                                weight: FontWeight.bold,
                                size: 12),
                            Container(
                                width: 250.w,
                                child: Multi(
                                    color: Colors.grey,
                                    subtitle: "${Provider11.time}",
                                    weight: FontWeight.normal,
                                    size: 12)),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () async {
                             
                     Navigator.of(context).push(
                      showPicker(
                       
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                        minuteInterval: TimePickerInterval.FIVE,
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          Provider11.time=dateTime.toString();
                        },
                      ),
                    );
                        },
                        child: UndeLinedMulti(
                            color: Color(0xffCC0006),
                            subtitle: "change",
                            weight: FontWeight.bold,
                            size: 12))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/phone.png",
                              height: 25.h,
                              width: 25.w,
                            )),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Multi(
                                color: Colors.white,
                                subtitle: "Phone Number",
                                weight: FontWeight.bold,
                                size: 12),
                            Container(
                                width: 250.w,
                                child: Multi(
                                    color: Colors.grey,
                                    subtitle: "${Provider11.phone}",
                                    weight: FontWeight.normal,
                                    size: 12)),
                          ],
                        )
                      ],
                    ),
                   GestureDetector(
                        onTap: () async {
                          numberSel();
                        },
                        child: UndeLinedMulti(
                            color: Color(0xffCC0006),
                            subtitle: "change",
                            weight: FontWeight.bold,
                            size: 12))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                   Column(
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
                                subtitle: "Cash On Deleivery",
                                weight: FontWeight.w600,
                                size: 18), // <-- Text
                            Image.asset(
                              "assets/cod2.png",
                              height: 40.h,
                              width: 40.w,
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedValue == 1
                            ? Colors.black
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          method="cod";
                          _selectedValue = 1;
                        });
                      },
                    )),
                SizedBox(
                  height: 10.h,
                ),
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
                            Image.asset(
                              "assets/visa.png",
                              height: 40.h,
                              width: 40.w,
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedValue == 2
                            ? Colors.black
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          method="visa";
                          _selectedValue = 2;
                        });
                      },
                    )),
                        ],
                      ),
                SizedBox(
                  height: 9.h,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Multi(
                        color: Colors.white,
                        subtitle: "${Provider11.items_in_cart!.length} Product(s)",
                        weight: FontWeight.bold,
                        size: 12),
                    GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      CartList()));
                        },
                        child: UndeLinedMulti(
                            color: Colors.red,
                            subtitle: "view all",
                            weight: FontWeight.bold,
                            size: 12))
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Multi(
                        color: Colors.grey,
                        subtitle: "Sub Total",
                        weight: FontWeight.bold,
                        size: 12),
                    UndeLinedMulti(
                        color: Colors.grey,
                        subtitle: "${Provider11.priceSum}",
                        weight: FontWeight.bold,
                        size: 12)
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Multi(
                        color: Colors.grey,
                        subtitle: "Delievery Fee",
                        weight: FontWeight.bold,
                        size: 12),
                    UndeLinedMulti(
                        color: Colors.grey,
                        subtitle: "100",
                        weight: FontWeight.bold,
                        size: 12)
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Multi(
                        color: Colors.grey,
                        subtitle: "Total",
                        weight: FontWeight.bold,
                        size: 12),
                    UndeLinedMulti(
                        color: Colors.white,
                        subtitle: "${Provider11.priceSum}",
                        weight: FontWeight.bold,
                        size: 16)
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
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
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
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
                  try {
                      if (Provider11.address!=""&&Provider11.phone!="") {
                          final FirebaseAuth auth = FirebaseAuth.instance;
                        final FirebaseFirestore db = FirebaseFirestore.instance;
                        final orderCollectionRef = db
                            .collection("orders")
                            .doc(Provider11.uid)
                            .collection("orders")
                            .doc();
                       orderCollectionRef.set({
                        "address":Provider11.address,
                        "time":Provider11.time,
                        "number":Provider11.phone,
                        "method":method,
                        "amount":Provider11.priceSum,
                        "deleivery":"100"
                       });
                       Provider11.items_in_cart!.clear();
                       Provider11.lat=null;
                       Provider11.lon=null;
                       Provider11.time=null;
                       Provider11.priceSum=0;
                       Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Congratulations, your Order Has Been Placed',
        title: 'Congratulations',
        context: context,
        actions: [
          IconsButton(
            onPressed: ()async {
              Provider11.itemLength=0;
               await Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Example()));
            },
            text: 'Done',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ],
      );
                      }
                  } catch (e) {
                    
                  }


                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
