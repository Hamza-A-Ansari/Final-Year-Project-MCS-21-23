import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'multiText.dart';

class ProductDisplay extends StatelessWidget {
  Uri? abc;
  String? imgAddress;
  String? price;
  String? title;
  Color? color;
  Color color1;
  Color color2;
  ProductDisplay(
      {super.key,
      required this.abc,
      required this.imgAddress,
      required this.price,
      required this.title,
      required this.color,
      required this.color1,
      required this.color2
      });

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(u) async {
      if (!await launchUrl(u)) {
        throw Exception('Could not launch $u');
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        width: 250,
       
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
          color: Colors.white
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(20) ,
                    topRight:Radius.circular(20) ,
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  gradient: new RadialGradient(
	  colors: [
      color1,
      color2
      // Color(0xffF4E2D8),
      // Color(0xffBA5370),
      ],
	),
                  

                ),
                child: Stack(
                  children: [
                    Align(child: Image.asset("$imgAddress",height: 200,width: 200,)),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30,
                        width: 60,
                        child: Center(child: Multi(color: Colors.white, subtitle: "New", weight: FontWeight.w500, size: 15)),
                       decoration: BoxDecoration(
                         color: Color.fromARGB(255, 125, 14, 6),
                         borderRadius: BorderRadius.circular(10)
                       ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 10,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 149,
                      child: Multi(
                          color: Color(0xff034047),
                          subtitle: "$title",
                          weight: FontWeight.w700,
                          size: 24)),
                  SizedBox(
                    height: 10,
                  ),
                  Multi(
                      color: Colors.black,
                      subtitle: "$price",
                      weight: FontWeight.w600,
                      size: 30),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black,width: 2)),
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child:  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                        
                                      ),
                                    ),
                                  child:  Text( 'Add',style: TextStyle(color: Colors.black),),
                                  onPressed: () {
                                    // Navigator.pushReplacement(context,
                                    //   MaterialPageRoute(builder:
                                    //     (context) => 
                                    //     Login()
                                    //     )
                                    //   );
                                  },
                                )
                            ),
                       Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black,width: 2)),
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child:  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                        
                                      ),
                                    ),
                                  child:  Text( 'Try on',style: TextStyle(color: Colors.black),),
                                  onPressed: () {
                                    // Navigator.pushReplacement(context,
                                    //   MaterialPageRoute(builder:
                                    //     (context) => 
                                    //     Login()
                                    //     )
                                    //   );
                                     _launchUrl(abc);
                                  },
                                )
                            ),
                         
                   
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        // ListView(
        //   children: [
        //     Image.asset("assets/img1.png",height: 200,width: 350,),
        //     SizedBox(height: 15,),
        //     Multi(color: Colors.black, subtitle: "Frame 1", weight: FontWeight.normal, size: 40),
        //     SizedBox(height: 15,),
        //     Padding(
        //       padding:  EdgeInsets.symmetric(horizontal: 20),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           ElevatedButton(onPressed: (){}, child: Text("Try on")),
        //           ElevatedButton(onPressed: (){}, child: Text("Add")),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
