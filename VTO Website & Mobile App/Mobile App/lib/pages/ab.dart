import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fypapp/pages/display2.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:fypapp/provider/provider1.dart';
import 'package:fypapp/utils/multiText.dart';
import 'package:http/http.dart' as http;
import '../utils/categories.dart';
import '../utils/framesDisplay.dart';
import '../utils/multi2.dart';
import '../utils/products.dart';
import '../utils/slider.dart';
import '../utils/special.dart';

class Ab extends StatelessWidget {
  const Ab({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("glasses");

    final databaseReference = FirebaseDatabase.instance.ref();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 31, 30, 30),
          Color.fromARGB(255, 54, 53, 53),
        ]),
      ),
      child: StreamBuilder(
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
