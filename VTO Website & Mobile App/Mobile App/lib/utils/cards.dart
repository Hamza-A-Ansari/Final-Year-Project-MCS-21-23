import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fypapp/provider/provider1.dart';
import 'package:fypapp/utils/multiText.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:camera/camera.dart';
import '../model/cardModel.dart';


class Card1 extends StatelessWidget {
  String imgAddress;
  Card1({super.key,required this.imgAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.black,width: 3)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Center(child: Multi(color: Colors.white, subtitle: 'Rs 1000', weight: FontWeight.bold, size: 14)),
                ),
                GestureDetector(
                  onTap: ()async{
                      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.camera);
                  },
                  child: Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Center(child: Multi(color: Colors.white, subtitle: 'Virtual Tryon', weight: FontWeight.bold, size: 12)),
                  ),
                ),
              ],
            ),
            Container(      
              child: Image.asset("$imgAddress",height: 200.h,width: double.infinity,),
            ),
      
          ],
        ),
      ),
    );
  }
}