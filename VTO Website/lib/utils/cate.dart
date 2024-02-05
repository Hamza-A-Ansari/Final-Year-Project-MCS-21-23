import 'package:flutter/material.dart';

import '../men.dart';
import 'multiText.dart';
class Category1 extends StatelessWidget {
  String imgAddress;
  String title;
  Category1({super.key,required this.imgAddress,required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
                  child: Container(
                      width: 250,
                      height: 300,
                      decoration: BoxDecoration(
                        boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(
                0,
                0,
              ),
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
                        borderRadius: BorderRadius.circular(20),
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
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(imgAddress),
                              backgroundColor: Colors.white,
                              radius: 50,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('$title',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              fontSize: 25),),
                          SizedBox(height: 15,),
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             child: ElevatedButton(
                                               onPressed: () {
                                                  Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => Men1()));
                                               },
                                               child: Multi(color: Colors.white, subtitle: "See more", weight: FontWeight.normal, size: 16),
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
                           ),

                        ],
                      )
                  ),

                );
  }
}