import 'package:flutter/material.dart';
import 'package:movies_app/res/components/color.dart';

class CustomText extends StatelessWidget{
  String text;
  double size;
  Color color;
  FontWeight bold;
  CustomText({required this.text, required this.size,this.color=HexColor.whiteColor,this.bold=FontWeight.normal});
  Widget build(BuildContext context){
    return Text(
      text,
      style: TextStyle(color: color,fontSize: size, fontWeight: bold),

    );
  }
}