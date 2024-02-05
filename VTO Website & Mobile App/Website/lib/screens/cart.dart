import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:p1/kids.dart';
import 'package:p1/screens/men.dart';
import 'package:p1/utils/cate.dart';
import 'package:p1/utils/framedisplay.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';
import 'package:p1/utils/multiText.dart';
import 'package:google_fonts/google_fonts.dart';
import '../men.dart';
import '../provider/provider1.dart';
import '../utils/multi2.dart';
import '../utils/slider.dart';
import '../women.dart';
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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import 'package:glass/glass.dart';
import 'package:intl/intl.dart';
import '../utils/multiText.dart';








class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
    final _formKey = GlobalKey<FormState>();
  String data = "";
  String value = "home";
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController addres = TextEditingController();
  TextEditingController mail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    return Scaffold(
       appBar: AppBar(
          title: const Text('Cart & Payment'),
        ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffF8AE3A),
                                    Color(0xffFC7884),
                                    Color(0xffFE1FF8),
                                  ],
                                )
        ),
       child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                   color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
               
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Multi(color: Color(0xff2032EB), subtitle: "Details", weight: FontWeight.bold, size: 20),
                        SizedBox(height: 10,),
                         Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Color(0xff2032EB),
                                          subtitle: "NAME",
                                          weight: FontWeight.w700,
                                          size: 12),
                                          Container()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.0
                                  ),
                                  TextFormField(
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    controller: name,
                                    cursorColor: Color(0xff2032EB),
                                    decoration: InputDecoration(
                                      hintText: "Enter your name",
                                      helperStyle: TextStyle(fontSize: 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff2032EB)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff2032EB)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0
                                  ),
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Color(0xff2032EB),
                                          subtitle: "PHONE",
                                          weight: FontWeight.w700,
                                          size: 12),
                                          Container()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.0
                                  ),
                                  TextFormField(
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    controller: phone,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(11),
                                    ],
                                    cursorColor: Color(0xff2032EB),
                                    decoration: InputDecoration(
                                      hintText: "Enter your phone number",
                                      helperStyle: TextStyle(fontSize: 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff2032EB)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff2032EB)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0
                                  ),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Color(0xff2032EB),
                                          subtitle: "Address",
                                          weight: FontWeight.w700,
                                          size: 12),
                                          Container()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.0
                                  ),
                                  TextFormField(
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    controller: addres,
                                    cursorColor: Color(0xff2032EB),
                                    decoration: InputDecoration(
                                      hintText:
                                          "Ex :Rashid Minhas Road RJ mall 4th floor Karachi",
                                      helperStyle: TextStyle(fontSize: 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff2032EB)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff2032EB)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0
                                  ),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Color(0xff2032EB),
                                          subtitle: "EMAIL",
                                          weight: FontWeight.w700,
                                          size: 12),
                                          Container()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.0
                                  ),
                                  TextFormField(
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    controller: mail,
                                    cursorColor: Color(0xff2032EB),
                                    decoration: InputDecoration(
                                      hintText: "EX:abc@xyz.com",
                                      helperStyle: TextStyle(fontSize: 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff2032EB)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff2032EB)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Color(0xff2032EB),
                                          subtitle: "LABEL AS",
                                          weight: FontWeight.w700,
                                          size: 12),
                                          Container()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.0
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            value = "home";
                                          });
                                        },
                                        child: value != 'home'
                                            ? Container(
                                                height: 70.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10.0,),
                                                    border: Border.all(
                                                        color: Color(0xff2032EB))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Icon(CupertinoIcons.house),
                                                    Multi(
                                                        color: Color(0xff2032EB),
                                                        subtitle: "Home",
                                                        weight: FontWeight.w700,
                                                        size: 13),
                                                    Icon(
                                                      CupertinoIcons.circle,
                                                      size: 15.0,
                                                      color: Color(0xff2032EB),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                height: 70.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10.0,),
                                                    border: Border.all(
                                                        color: Color(0xff2032EB),
                                                        width: 2)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.house,
                                                      color: Color(0xff2032EB),
                                                    ),
                                                    Multi(
                                                        color: Color(0xff2032EB),
                                                        subtitle: "Home",
                                                        weight: FontWeight.w700,
                                                        size: 13),
                                                    Icon(
                                                      CupertinoIcons
                                                          .check_mark_circled_solid,
                                                      size: 15.0,
                                                      color: Color(0xff2032EB),
                                                    )
                                                  ],
                                                ),
                                              ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            value = "work";
                                          });
                                        },
                                        child: value != 'work'
                                            ? Container(
                                                height: 70.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10.0,),
                                                    border: Border.all(
                                                        color: Color(0xff2032EB))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Icon(CupertinoIcons.briefcase),
                                                    Multi(
                                                        color: Color(0xff2032EB),
                                                        subtitle: "Work",
                                                        weight: FontWeight.w700,
                                                        size: 13),
                                                    Icon(
                                                      CupertinoIcons.circle,
                                                      size: 15.0,
                                                      color: Color(0xff2032EB),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                height: 70.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10.0,),
                                                    border: Border.all(
                                                        color: Color(0xff2032EB),
                                                        width: 2)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.briefcase,
                                                      color: Color(0xff2032EB),
                                                    ),
                                                    Multi(
                                                        color: Color(0xff2032EB),
                                                        subtitle: "Work",
                                                        weight: FontWeight.w700,
                                                        size: 13),
                                                    Icon(
                                                      CupertinoIcons
                                                          .check_mark_circled_solid,
                                                      size: 15.0,
                                                      color: Color(0xff2032EB),
                                                    )
                                                  ],
                                                ),
                                              ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            value = "other";
                                          });
                                        },
                                        child: value != 'other'
                                            ? Container(
                                                height: 70.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10.0,),
                                                    border: Border.all(
                                                        color: Color(0xff2032EB))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Icon(CupertinoIcons.add),
                                                    Multi(
                                                        color: Color(0xff2032EB),
                                                        subtitle: "other",
                                                        weight: FontWeight.w700,
                                                        size: 13),
                                                    Icon(CupertinoIcons.circle,
                                                        size: 15.0,
                                                        color: Color(0xff2032EB))
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                height: 70.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10.0,),
                                                    border: Border.all(
                                                        color: Color(0xff2032EB),
                                                        width: 2)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.add,
                                                      color: Color(0xff2032EB),
                                                    ),
                                                    Multi(
                                                        color: Color(0xff2032EB),
                                                        subtitle: "Other",
                                                        weight: FontWeight.w700,
                                                        size: 13),
                                                    Icon(
                                                      CupertinoIcons
                                                          .check_mark_circled_solid,
                                                      size: 15.0,
                                                      color: Color(0xff2032EB),
                                                    )
                                                  ],
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0
                                  ),
                                    ElevatedButton(
                      onPressed: () {
                       
                      },
                      child: Multi(color: Colors.white, subtitle: "Confirm Order", weight: FontWeight.normal, size: 16),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        backgroundColor:Color(0xff2032EB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                       color: Colors.white
                      ),
                      child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ListView.builder(
                  itemCount: Provider11.items_in_cart!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 70),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffF8AE3A),
                                    Color(0xffFC7884),
                                    Color(0xffFE1FF8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            width: 600,
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                 
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                          image: DecorationImage(
            
                                            image: AssetImage(Provider11
                                                .items_in_cart![index].imgAddress),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 10),
                                            child: Container(
                                              width: 200,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Multi(
                                                      color: Colors.white,
                                                      subtitle:
                                                          "${Provider11.items_in_cart![index].title.length > 10 ? Provider11.items_in_cart![index].title.substring(0, 11) + "..." : Provider11.items_in_cart![index].title}",
                                                      weight: FontWeight.bold,
                                                      size: 12),
                                                  Multi(
                                                      color: Colors.white,
                                                      subtitle:
                                                          "${Provider11.items_in_cart![index].title.length > 10 ? Provider11.items_in_cart![index].title.substring(0, 11) + "..." : Provider11.items_in_cart![index].title}",
                                                      weight: FontWeight.bold,
                                                      size: 12),
                                                  Multi(
                                                      color: Colors.white,
                                                      subtitle:
                                                          "Rs ${double.parse(Provider11.items_in_cart![index].eachCost.toString())}",
                                                      weight: FontWeight.w900,
                                                      size: 10),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 30),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Multi(
                                                    color: Colors.white,
                                                    subtitle:
                                                        "Rs ${double.parse(Provider11.items_in_cart![index].cost.toString())}",
                                                    weight: FontWeight.bold,
                                                    size: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color(0xffCC0006),
                                                            spreadRadius: 0.3,
                                                            blurRadius: 7,
                                                            offset:
                                                                const Offset(1, 1),
                                                          ),
                                                          const BoxShadow(
                                                              color: Colors.white,
                                                              offset:
                                                                  Offset(-1, -1),
                                                              blurRadius: 7,
                                                              spreadRadius: 0.3),
                                                        ],
                                                        gradient: RadialGradient(
                                                          colors: [
                                                            Color.fromARGB(
                                                                255, 233, 48, 54),
                                                            Color(0xffCC0006),
                                                          ],
                                                        ),
                                                      ),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Provider11
                                                              .CartCountIncreament(
                                                                  Provider11
                                                                      .items_in_cart![
                                                                          index]
                                                                      .count,
                                                                  index);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Multi(
                                                        color: Colors.white,
                                                        subtitle:
                                                            "${Provider11.items_in_cart![index].count}",
                                                        weight: FontWeight.w800,
                                                        size: 16),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color(0xffCC0006),
                                                            spreadRadius: 0.3,
                                                            blurRadius: 7,
                                                            offset:
                                                                const Offset(1, 1),
                                                          ),
                                                          const BoxShadow(
                                                              color: Colors.white,
                                                              offset:
                                                                  Offset(-1, -1),
                                                              blurRadius: 7,
                                                              spreadRadius: 0.3),
                                                        ],
                                                        gradient: RadialGradient(
                                                          colors: [
                                                            Color.fromARGB(
                                                                255, 233, 48, 54),
                                                            Color(0xffCC0006),
                                                          ],
                                                        ),
                                                      ),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                         if (Provider11.items_in_cart![index].count!=1) {
                                                            Provider11
                                                              .CartCountDecreament(
                                                                  Provider11
                                                                      .items_in_cart![
                                                                          index]
                                                                      .count,
                                                                  index);
                                                         } else {
                                                           Provider11.items_in_cart!.removeAt(index);
                                                           Provider11.decreamentCart();
                                                           Navigator.push(
                      context,
                      MaterialPageRoute(
                builder: (BuildContext context) => super.widget));
                                                            Provider11.items_in_cart!.length==0? Navigator.of(context):null;
                                                         }
                                                        },
                                                        child: Icon(
                                                          Provider11
                                                                      .items_in_cart![
                                                                          index]
                                                                      .count ==
                                                                  1
                                                              ? CupertinoIcons
                                                                  .delete
                                                              : Icons.remove,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                      ),
                    ),
            ),
      )
            
        ],
       ),
      ),
    );
  }
}