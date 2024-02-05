
import 'package:flutter/material.dart';
class CardModel {
    String? title;                  /// required
    String? imagePath;            /// required  i.e "assets/images/image.png"
    String? description;        /// (Optional)
    Color? color;    
    CardModel({ this.title,this.imagePath,this.description,this.color});         /// (Optional) add this parameter if you want to have different color on each card
}

