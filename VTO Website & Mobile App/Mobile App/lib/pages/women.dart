import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
import '../utils/special.dart';
import 'ab.dart';
import 'display2.dart';

class WoMenSection extends StatelessWidget {
  const WoMenSection({super.key});

  @override
  Widget build(BuildContext context) {
     final ref = FirebaseDatabase.instance.ref("women");

    final databaseReference = FirebaseDatabase.instance.ref();
    return Scaffold(
       appBar: AppBar(
        title: Multi3(color: Colors.white, subtitle: "Women Wearing", weight: FontWeight.normal, size: 21),
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
      body:StreamBuilder(
        stream: ref.onValue,
        builder: ((context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            Map<dynamic, dynamic> map =
                snapshot.data!.snapshot.value as dynamic;
            List<dynamic> list = [];
            list.clear();
            list = map.values.toList();
            return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 210.h,
                  crossAxisCount: 2,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.snapshot.children.length,
                itemBuilder: (BuildContext context, int index) {
                  print(index);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        DisplayProduct3(id: 1, imgAddress: list[index]['address'], title: list[index]['name'], price: list[index]['price'].toString(), stock: "stock", tax: "tax", colors: list[index]['color'], count: 2, gender: list[index]['gender'], shape: list[index]['shape'], size: list[index]['size'],)));
                      },
                      child: Special(
                        imgAddress: list[index]['address'],
                        price: list[index]['price'].toString(),
                        title: list[index]['name'].toString(),
                      ),
                    ),
                  );
                });
          }

          return Container();
        }),
      ),
    );
  }
}