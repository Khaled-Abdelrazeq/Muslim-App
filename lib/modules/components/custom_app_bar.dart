import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_task/modules/components/custom_text.dart';
import 'package:muslim_task/shared/enum/fonts_weight_enum.dart';
import 'package:muslim_task/shared/styles/custom_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key, this.isHasBackButton = false, this.onBackTap, this.title,
  }) : super(key: key);

  final bool isHasBackButton;
  final Function()? onBackTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 17, left: 22, right: 22),
      height: Get.height * 0.12,
      decoration: const BoxDecoration(
        color: CustomColors.primary,
      ),
      child: Row(
        children: [
          Visibility(
            visible: isHasBackButton,
            child: GestureDetector(
                onTap: onBackTap,
                child: const Icon(Icons.arrow_back, color: CustomColors.textColor,)),
          ),
          const Spacer(),
          CustomText(
            text: title,
            fontSize: 16,
            textColor: CustomColors.textColor,
            fontsWeight: FontsWeight.bold,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}