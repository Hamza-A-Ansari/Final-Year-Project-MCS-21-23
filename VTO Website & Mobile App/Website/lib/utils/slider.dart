import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:p1/utils/framedisplay.dart';
import 'package:url_launcher/url_launcher.dart';


class Slider23 extends StatefulWidget {
  const Slider23({super.key});

  @override
  State<Slider23> createState() => _Slider23State();
}

class _Slider23State extends State<Slider23> {
  @override
  
  late PageController _pageController;
  int activeIndex = 0;
  List<String> images = [
    "assets/carousel2.jpg",
    "assets/carousel3.jpg",
    "assets/carousel4.jpg",
    "assets/carousel4.png",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }
 int activePage = 0;
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length, 
          itemBuilder: (context,index,realIndex){
            final img = images[index];
            return buildImage(img,index);
          }, 
          options: CarouselOptions(   
            height: 350,
            autoPlay: true,
            reverse: true,
            autoPlayInterval: Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          )),
          SizedBox(height: 10,),
        
      ],
    );

      
  }
  Widget buildImage(String img , int index)=> Container(
        color: Colors.grey,
        child:  Image.asset(img,fit: BoxFit.cover,width:double.infinity,),
      );
  
}