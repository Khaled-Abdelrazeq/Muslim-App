import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_task/models/surah_model.dart';
import 'package:muslim_task/modules/components/custom_text.dart';
import 'package:muslim_task/shared/enum/fonts_weight_enum.dart';
import 'package:muslim_task/shared/styles/app_assets.dart';
import 'package:muslim_task/shared/styles/custom_colors.dart';

class CustomQuranSurah extends StatelessWidget {
  const CustomQuranSurah({
    Key? key, required this.surah, this.onSurahTap,
  }) : super(key: key);

  final SurahModel surah;
  final Function()? onSurahTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSurahTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: CustomColors.textColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 7),
            Image.asset(AppAssets.logo, width: 56, height: 56,),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.4,
                    child: CustomText(
                      text: surah.name,
                      fontsWeight: FontsWeight.regular,
                      fontSize: 18,

                    ),
                  ),
                  const SizedBox(height: 6),
                  CustomText(
                    text: 'رقم السورة: ${surah.number}',
                    textColor: CustomColors.contentTextColor,
                    fontSize: 16,
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  text: surah.revelationType == 'makkah'? 'مكية' : 'مدنية',
                  fontsWeight: FontsWeight.regular,
                  fontSize: 16,
                  textColor: CustomColors.primary,
                ),
                const SizedBox(height: 6),
                CustomText(
                  text: 'عدد آياتها : ${surah.numberOfAyahs}',
                  textColor: CustomColors.contentTextColor,
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}