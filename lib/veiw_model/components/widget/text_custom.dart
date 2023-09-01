import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextCustom extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  const TextCustom({required this.text,this.maxLines=10,this.color,this.fontSize=16,this.fontWeight,
    this.textAlign=TextAlign.center,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Cloudy June',

        fontSize: fontSize?.sp,
        fontWeight:fontWeight ,
        color: color,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign:  textAlign,
    );
  }
}
