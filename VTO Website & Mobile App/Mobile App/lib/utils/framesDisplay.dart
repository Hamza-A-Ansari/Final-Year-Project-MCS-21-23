import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fypapp/pages/display2.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/display.dart';
import 'multiText.dart';

class ProductDisplay2 extends StatelessWidget {
  Uri? abc;
  String? imgAddress;
  String? price;
  String? title;
  Color? color;
  Color color1;
  Color color2;
  ProductDisplay2(
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
        height: 300.h,
        width: 200.w,
       
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
                height: 100.h,
                width: 200.w,
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
                    Align(child: Image.asset("$imgAddress",height: 200.h,width: 200.w,)),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30.h,
                        width: 60.w,
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
              bottom: 10,
              right: 10,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 149.w,
                      child: Multi(
                          color: Color(0xff034047),
                          subtitle: "$title",
                          weight: FontWeight.w700,
                          size: 16)),
                  SizedBox(
                    height: 3.h,
                  ),
                  Multi(
                      color: Colors.black,
                      subtitle: "$price",
                      weight: FontWeight.w600,
                      size: 15),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                                height: 35.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black,width: 2)),
                                // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child:  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                        
                                      ),
                                    ),
                                  child: Text( 'Add',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder:
                                        (context) => 
                                        DisplayProduct3(
                                          id: 1, 
                                          imgAddress: imgAddress, 
                                          title: title, 
                                          price: price, 
                                          stock: "stock", 
                                          tax: "tax", 
                                          colors: "many", 
                                          count: count, 
                                          gender: "Male", 
                                          shape: "many", 
                                          size: "medium , small")
                                        )
                                      );
                                  },
                                )
                            ),
                       Container(
                               height: 35.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black,width: 2)),
                                // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child:  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                        
                                      ),
                                    ),
                                  child:  Text( 'Try on',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                                  onPressed: () {
                                    // Navigator.pushReplacement(context,
                                    //   MaterialPageRoute(builder:
                                    //     (context) => 
                                    //     Login()
                                    //     )
                                    //   );
                                     try {
                                       _launchUrl(abc);
                                     } catch (e) {
                                       print("${e}------------------>");
                                     }
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
      ),
    );
  }
}
