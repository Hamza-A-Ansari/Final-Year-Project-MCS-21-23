import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p1/utils/cate.dart';
import 'package:p1/utils/framedisplay.dart';
import 'package:p1/utils/framedisplay2.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';
import 'package:p1/utils/multiText.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/provider1.dart';
import '../utils/slider.dart';

class View extends StatelessWidget {
  String name;
  String colors;
  String imgAddress;
  String price;
  View({super.key,required this.colors,required this.imgAddress,required this.name,required this.price});
 
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    return Column(
      children: [
        Expanded(
          flex: 1,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/logo2.png"),
              Container()
            ],
          ) 
        ),
        Expanded(
          flex: 5,
          child: Row(
            children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                height: 400,
                width: double.infinity,
                child: PhotoView(
                    imageProvider: AssetImage("$imgAddress"),
                  ),
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12,width: 2),
                    borderRadius: BorderRadius.circular(10),
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
                   height: 400,
                  width: double.infinity,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                 Multi(color: Colors.black, subtitle: "$name", weight: FontWeight.normal, size: 21),
                                 SizedBox(height: 5,),
                             Multi(color: Colors.white, subtitle: "RB7216 NEW CLUBMASTER OPTICS", weight: FontWeight.bold, size: 16)
                              ],
                            ),
                            Icon(Icons.favorite,color: Colors.white,)
                          ],
                         ),
                         SizedBox(height: 5,),
                         Divider(color: Colors.white,),
                         SizedBox(height: 5,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Multi(color: Colors.white, subtitle: "Colors Available", weight: FontWeight.bold, size: 12),
                             Multi(color: Colors.white, subtitle: "$colors", weight: FontWeight.bold, size: 12),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("$imgAddress"),
                                  fit: BoxFit.cover
                                  )
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("$imgAddress"),
                                  fit: BoxFit.cover
                                  )
                              ),
                            )
                          ],
                         ),
                        SizedBox(height: 5,),
                         Divider(color: Colors.white,),
                         SizedBox(height: 5,),
                            
                        Row(
                          children: [
                            Multi(color: Colors.white, subtitle: "Size", weight: FontWeight.bold, size: 12),
                            SizedBox(width: 10,),
                            SlidingSwitch(
                             value: false,
                             width: 200,
                             onChanged: (bool value) {
                               print(value);
                             },
                             height : 25,
                             animationDuration : const Duration(milliseconds: 400),
                             onTap:(){},
                             onDoubleTap:(){},
                             onSwipe:(){},
                             textOff : "15mm-20mm",
                             textOn : "20mm-30mm",
                             contentSize: 10,
                             colorOn : const Color(0xffdc6c73),
                             colorOff : const Color(0xff6682c0),
                             background : const Color(0xffe4e5eb),
                             buttonColor : const Color(0xfff7f5f7),
                             inactiveColor : const Color(0xff636f7b),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                         Divider(color: Colors.white,),
                         SizedBox(height: 5,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Multi(color: Colors.white, subtitle: "TOTAL", weight: FontWeight.normal, size: 16),
                             Multi(color: Colors.white, subtitle: "\$$price", weight: FontWeight.bold, size: 21)
                          ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            ElevatedButton(
                    onPressed: () {

                      Provider11.items_in_cart!.add(CartItems(123, imgAddress, name, name, int.parse(price.toString()), 1, int.parse(price.toString())));
                      Provider11.increamentCart();
                      Navigator.pop(context);
                    },
                    child: Multi(color: Colors.white, subtitle: "Add to cart", weight: FontWeight.normal, size: 16),
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
                         SizedBox(height: 5,),
                         Divider(color: Colors.white,),
                         SizedBox(height: 5,),
                        Container(
                          color: Colors.white,
                          child: CarouselSlider(
                                         items: [
                    
                                Multi(color: Colors.red, subtitle: "Free Shipping ", weight: FontWeight.normal, size: 12),
                                Multi(color: Colors.red, subtitle: "Stock Available", weight: FontWeight.normal, size: 12),
                                Multi(color: Colors.red, subtitle: "Freeways Available", weight: FontWeight.normal, size: 12)
                          ],
                                         options: CarouselOptions(
                            height: 30,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                                         
                            scrollDirection: Axis.horizontal,
                                         )
                                       ),
                        )
                            
                        ],
                      ),
                    ),
                  )
                ),
              )
            ),
            ],
          ),
        ),
      ],
    ) ;
  }
}