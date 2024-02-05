import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heading extends StatelessWidget {
  final String heading;
   Heading({Key? key,required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        heading,
        style: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),
      ),
    );
  }
}
