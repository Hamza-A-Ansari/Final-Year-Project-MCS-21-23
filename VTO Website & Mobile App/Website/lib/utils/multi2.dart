import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Multi2 extends StatelessWidget {
  Color color;
  String subtitle;
  FontWeight weight;
  Color shadowColor;
  double size;
  Multi2({super.key,required this.color,required this.subtitle,required this.weight,required this.size,required this.shadowColor});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        
  subtitle,
  style: GoogleFonts.satisfy(
    textStyle: TextStyle(color: color, letterSpacing: 0.2,fontSize: size,fontWeight: weight,shadows: <Shadow>[
      Shadow(
        offset: Offset(10.0, 10.0),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      Shadow(
        offset: Offset(10.0, 10.0),
        blurRadius: 8.0,
        color: Color.fromARGB(125, 0, 0, 255),
      ),
    ],),
  ),
  textAlign: TextAlign.center,
),

    );
  }
}