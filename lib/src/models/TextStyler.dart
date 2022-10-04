import 'dart:ui';

import 'package:flutter/material.dart';

class TextStyler extends Text {
  TextStyler(String data,{color:Colors.white,fonSize:10.0,fontWeight:FontWeight.normal,height:1.5,textAlign:TextAlign.start}) : 
  super(data, 
  style: TextStyle(
    fontWeight: fontWeight, 
    fontSize: fonSize, 
    color: color, 
    height: height, 
  ), 
  textAlign: textAlign
  );
}