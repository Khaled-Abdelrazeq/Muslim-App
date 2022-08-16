import 'package:flutter/material.dart';
import 'package:muslim_task/shared/enum/fonts_weight_enum.dart';
import 'package:muslim_task/shared/styles/custom_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
        this.label,
        this.icon,
        this.onTap,
        this.iconColor,
        this.backgroundColor,
        this.width = 300,
        this.height = 40,
        this.fontSize = 14,
        this.textColor = Colors.white,
        this.withBorder = true,
        this.borderRadius = 9,
        this.blurRadius = 10,
        this.fontsWeight,
        this.boxShadow, this.onHover,
      })
      : super(key: key);
  final String? label;
  final Color? backgroundColor;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final double fontSize;
  final Color textColor;
  final bool withBorder;
  final double borderRadius;
  final double blurRadius;
  final FontsWeight? fontsWeight;
  final BoxShadow? boxShadow;
  final Function(bool? )? onHover;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.white, width: withBorder? 1 : 0),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [boxShadow?? BoxShadow(color: Colors.black12, blurRadius: blurRadius)]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: backgroundColor,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: backgroundColor?? CustomColors.lightGrey,
                alignment: Alignment.center,
                textStyle: TextStyle(
                  fontSize: fontSize,
                )),
            onPressed: onTap,
            icon: Visibility(
                visible: icon != null,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: iconColor ?? CustomColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 20),
                  ],
                )),
            label: Text(
              '$label'.toUpperCase(),
              style: TextStyle(color: textColor, fontSize: fontSize, decoration: TextDecoration.none,
                fontWeight: fontsWeight == FontsWeight.bold? FontWeight.w700 :
                fontsWeight == FontsWeight.medium? FontWeight.w500:
                fontsWeight == FontsWeight.regular? FontWeight.w400:
                FontWeight.w300,
              ),

            ),),
        ),
      ),
    );
  }
}
