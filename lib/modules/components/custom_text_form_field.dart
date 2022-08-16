import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_task/shared/enum/fonts_weight_enum.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, this.onChange,
    this.onSubmit,
    this.controller,
    this.hint,
    this.height = 40,
    this.width,
    this.background,
    this.borderRadius,
    this.boxShadow,
    this.hintSize = 14,
    this.textColor,
    this.textInputType = TextInputType.text,
    this.maxLength,
    this.validator,
    this.fontsWeight,
    this.obscureText, this.suffixIcon}) : super(key: key);

  final Function(String?)? onChange;
  final Function(String?)? onSubmit;
  final TextEditingController? controller;
  final String? hint;
  final double? hintSize;
  final Color? textColor;
  final double? height;
  final double? width;
  final Color? background;
  final BorderRadius? borderRadius;
  final BoxShadow? boxShadow;
  final TextInputType textInputType;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final FontsWeight? fontsWeight;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? Get.width,
      padding: const EdgeInsets.only(
        left: 15,
        // top: 10,
        // bottom: 10
      ),
      decoration: BoxDecoration(
        color: background?? Colors.white12.withOpacity(0.2),
        borderRadius: borderRadius?? BorderRadius.circular(12),
        boxShadow: [boxShadow?? const BoxShadow(color: Colors.transparent)]),
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        keyboardType: textInputType,
        maxLength: maxLength,
        validator: validator,
        obscureText: obscureText??false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: suffixIcon?? const Icon(Icons.search_outlined),
          hintText: hint,
          hintStyle: TextStyle(
            color: textColor?? Colors.white.withOpacity(0.70),
            fontSize: hintSize,
            fontWeight: fontsWeight == FontsWeight.bold?
            FontWeight.w800
                : fontsWeight == FontsWeight.medium?
            FontWeight.w700
                : fontsWeight == FontsWeight.regular?
            FontWeight.w500
                : FontWeight.w400,
          ),
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
