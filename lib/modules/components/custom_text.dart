import 'package:flutter/material.dart';
import 'package:muslim_task/shared/enum/fonts_weight_enum.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, this.text, this.textColor, this.alignment,
    this.textDecoration, this.textDirection, this.fontSize = 16, this.fontsWeight, this.textAlign}) : super(key: key);

  final String? text;
  final Color? textColor;
  final Alignment? alignment;
  final TextDecoration? textDecoration;
  final TextDirection? textDirection;
  final double? fontSize;
  final FontsWeight? fontsWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text??'',
        textDirection: textDirection,
        textAlign: textAlign,
        // maxLines: 1,
        style: TextStyle(
          // fontFamily: 'ArabicFont',
          height: 1.6,
          fontSize: fontSize,
          color: textColor,
          decoration: textDecoration,
          fontWeight: fontsWeight == FontsWeight.bold?
              FontWeight.w800
              : fontsWeight == FontsWeight.medium?
              FontWeight.w700
              : fontsWeight == FontsWeight.regular?
              FontWeight.w500
              : FontWeight.w300
      ),),
    );
  }
}
