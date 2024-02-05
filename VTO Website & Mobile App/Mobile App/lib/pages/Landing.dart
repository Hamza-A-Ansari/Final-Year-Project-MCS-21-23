import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fypapp/pages/men.dart';
import 'package:fypapp/pages/women.dart';
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
import 'ab.dart';
import 'cartList.dart';
import 'kids.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {

final Provider11 = Provider.of<Provider1>(context);
    final scrollController = ScrollController();
    Uri _url1 = Uri.parse('http://192.168.0.128:8501/01');
    Uri _url2 = Uri.parse('http://192.168.0.128:8501/001');
    Uri _url3 = Uri.parse('http://192.168.0.128:8501/1');
    Uri _url4 = Uri.parse('http://192.168.0.128:8501/2');
    Uri _url5 = Uri.parse('http://192.168.0.128:8501/3');
    Uri _url6 = Uri.parse('http://192.168.0.128:8501/4');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg2.png"))
        ),
        child: Scaffold(
           floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CartList()));
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 25.r,
                child: Stack(
                  children: [
                    CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/cart4.png",
                            height: 60.h, width: 60.w)),
                    Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 8.r,
                          child: Multi(
                              color: Colors.white,
                              subtitle: "${Provider11.itemLength}",
                              weight: FontWeight.w800,
                              size: 10),
                        )),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 110, 14, 7)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.r,
                        child: Image.asset("assets/user.png"),
                      ),
                      Multi(color: Colors.white, subtitle: Provider11.name.toString(), weight: FontWeight.bold, size: 12,),
                      Multi(color: Colors.white, subtitle: Provider11.gmail.toString(), weight: FontWeight.bold, size: 10,),
                  ],)
                ),
                ListTile(
                  leading: Image.asset("assets/men1.png",height: 30.h,width: 30.w,),
                  title: Multi2(color: Color.fromARGB(255, 110, 14, 7), subtitle: "Men Collection", weight: FontWeight.bold, size: 15),
                  onTap: () {
                      Navigator.push(
              context, MaterialPageRoute(builder: (context) => MenSection()));
                  },
                ),
                 ListTile(
                  leading: Image.asset("assets/women1.png",height: 30.h,width: 30.w,),
                  title: Multi2(color: Color.fromARGB(255, 110, 14, 7), subtitle: "Women Collection",weight: FontWeight.bold, size: 15),
                  onTap: () {
                      Navigator.push(
              context, MaterialPageRoute(builder: (context) => WoMenSection()));
                  },
                ),
                 ListTile(
                  leading: Image.asset("assets/kid1.png",height: 30.h,width: 30.w,),
                  title:Multi2(color: Color.fromARGB(255, 110, 14, 7), subtitle: "Kids Collection", weight: FontWeight.bold, size: 15),
                  onTap: () {
                      Navigator.push(
              context, MaterialPageRoute(builder: (context) => KidSection()));
                  },
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Container(
              child: Stack(
                children: [
                  ListView(
                    controller: scrollController,
                    children: [
                      SizedBox(height: 10.h,),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 55.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Builder(builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: AvatarGlow(
                                    endRadius: 60.r,
                                    glowColor: Colors.red,
                                    child: Material(
                                      // Replace this child with your own
                                      elevation: 8.0,
                                      shadowColor: Colors.red,
                                      shape: CircleBorder(),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey[100],
                                        child: Image.asset(
                                          'assets/drawer.png',
                                          height: 30.h,
                                        ),
                                        radius: 20.r,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              Multi(
                                  color: Colors.white,
                                  subtitle: "MirrorMeNow",
                                  weight: FontWeight.bold,
                                  size: 15),
                              AvatarGlow(
                                endRadius: 60.r,
                                glowColor: Colors.red,
                                child: Material(
                                  // Replace this child with your own
                                  shadowColor: Colors.red,
                                  elevation: 8.0,
                                  shape: CircleBorder(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey[100],
                                    child: Image.asset(
                                      'assets/user.png',
                                      height: 30.h,
                                    ),
                                    radius: 20.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Container(
                            child: Container(
                              height: 55.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 10.w, left: 10.w),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search_outlined,
                                          color: Color(0xffCC0006),
                                          size: 35,
                                          weight: 200,
                                        ),
                                        suffixIcon: Container(
                                          width: 75.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25.r),
                                            color: Color(0xffCC0006),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Multi(
                                                  color: Colors.white,
                                                  subtitle: "Filter",
                                                  weight: FontWeight.bold,
                                                  size: 13),
                                              Icon(CupertinoIcons.color_filter,
                                                  color: Colors.white, size: 20)
                                            ],
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: "Search here",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Slider23(),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Container(
                          height: 180.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Multi(color: Colors.white, subtitle: "Frames Categories", weight: FontWeight.bold, size: 14),
                                SizedBox(height: 15.h,),
                                Container(
                                  height: 120.h,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      // scrollDirection: Axis.horizontal,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            scrollController.animateTo(
                                              200.h, // Replace 100 with the Y offset of the item you want to scroll to
                                              duration: Duration(milliseconds: 500),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          child: CategoryData(
                                            imgAddress: "assets/square-glasses.png",
                                            title: 'Square Glasses',
                                            color1: Colors.pink.withOpacity(0.3),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            scrollController.animateTo(
                                              500.h, // Replace 100 with the Y offset of the item you want to scroll to
                                              duration: Duration(milliseconds: 500),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          child: CategoryData(
                                            imgAddress: "assets/round-glasses.png",
                                            title: 'Round Glasses',
                                            color1: Colors.amber.withOpacity(0.3),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                             scrollController.animateTo(
                                              800.h, // Replace 100 with the Y offset of the item you want to scroll to
                                              duration: Duration(milliseconds: 500),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          child: CategoryData(
                                            imgAddress: "assets/cat-eye-glasses.png",
                                            title: 'Cat Eye',
                                            color1: Colors.green.withOpacity(0.3),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                             scrollController.animateTo(
                                              1100.h, // Replace 100 with the Y offset of the item you want to scroll to
                                              duration: Duration(milliseconds: 500),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          child: CategoryData(
                                            imgAddress: "assets/men-glasses.png",
                                            title: 'Aviator',
                                            color1: Colors.teal.withOpacity(0.3),
                                          ),
                                        ),
                                     
                                       
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(color: Colors.white,thickness: 1.5,),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi(
                                color: Colors.white,
                                subtitle: "Trendy Products",
                                weight: FontWeight.bold,
                                size: 18),
                            Container()
                          ],
                        ),
                      ),
                    
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Container(
                          height: 250.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                               ProductDisplay2(
                          abc: _url1,
                          imgAddress: "assets/images/01.png",
                          price: "3,200",
                          title: "Diesel Round Eyeglasses",
                          color: Colors.blue.withOpacity(0.3),
                          color1: Color(0xffaaffa9),
                          color2: Color(0xff11ffbd),
                        ),
                        ProductDisplay2(
                          abc: _url2,
                          imgAddress: "assets/images/001.png",
                          price: "1,200",
                          title: "Full frame plastic",
                          color: Colors.red.withOpacity(0.3),
                          color1: Color(0xffc9ffbf),
                          color2: Color(0xffffafbd),
                        ),
                        ProductDisplay2(
                          abc: _url3,
                          imgAddress: "assets/images/1.png",
                          price: "3,200",
                          title: "Full frame plastic",
                          color: Colors.blue.withOpacity(0.3),
                          color1: Color(0xffaaffa9),
                          color2: Color(0xff11ffbd),
                        ),
                        ProductDisplay2(
                          abc: _url4,
                          imgAddress: "assets/images/2.png",
                          price: "5,200",
                          title: "Full frame plastic",
                          color: Colors.yellow.withOpacity(0.3),
                          color1: Color(0xff83a4d4),
                          color2: Color(0xffb6fbff),
                        ),
                        ProductDisplay2(
                          abc: _url5,
                          imgAddress: "assets/images/3.png",
                          price: "2,200",
                          title: "Full Metal Frame",
                          color: Colors.pink.withOpacity(0.3),
                          color1: Color(0xffefefbb),
                          color2: Color(0xffd4d3dd),
                        ),
                         ProductDisplay2(
                          abc: _url6,
                          imgAddress: "assets/images/4.png",
                          price: "2,200",
                          title: "Full Metal Frame",
                          color: Colors.pink.withOpacity(0.3),
                          color1: Color(0xffefefbb),
                          color2: Color(0xffd4d3dd),
                        ),
                            ],
                          ),
                        ),
                      ),
                    
                      Divider(color: Colors.white,thickness: 1.5,),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 400.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/men.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 20,
                                left: 20,
                                bottom: 20,
                                child: Container(
                                    height: 48,
                                    width: 90,
                                    child: ElevatedButton(
                                      onPressed: () {
                                                              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          MenSection()));
                                      },
                                      child: Text("Men Wearing"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 400.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/women.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 20,
                                left: 20,
                                bottom: 20,
                                child: Container(
                                    height: 48,
                                    width: 90,
                                    child: ElevatedButton(
                                      onPressed: () {
                     Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          WoMenSection()));
                                      },
                                      child: Text("Women Wearing"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 400.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/kids.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 20,
                                left: 20,
                                bottom: 20,
                                child: Container(
                                    height: 48,
                                    width: 90,
                                    child: ElevatedButton(
                                      onPressed: () {
                                           Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          KidSection()));
                                      },
                                      child: Text("Kids Wearing"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      
                    ],
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