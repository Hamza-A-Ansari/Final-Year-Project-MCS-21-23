import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Container1 extends StatelessWidget {
  const Container1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView(
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img1.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: 
                (){

                }, child: Text("Virtual Try-On")),
                 ElevatedButton(onPressed: 
                (){

                }, child: Text("Add to Cart"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
