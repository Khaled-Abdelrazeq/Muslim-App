import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_task/modules/components/custom_app_bar.dart';
import 'package:muslim_task/modules/components/custom_text.dart';
import 'package:muslim_task/modules/details/details_controller.dart';
import 'package:muslim_task/shared/enum/fonts_weight_enum.dart';
import 'package:muslim_task/shared/styles/app_assets.dart';
import 'package:muslim_task/shared/styles/custom_colors.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  final DetailsController controller = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackground,
      body: Column(
        children: [
          CustomAppBar(
            isHasBackButton: true,
            title: 'القرآن الكريم',
            onBackTap: controller.onBackTap,
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(AppAssets.font, width: 12, height: 12,),
                    const SizedBox(width: 5.5),
                    const CustomText(
                      text: 'حجم الخط',
                      fontSize: 12,
                      textColor: CustomColors.primary,
                      fontsWeight: FontsWeight.regular,
                    ),
                  ],
                ),
                ///Slider
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GetBuilder<DetailsController>(
                    builder: (context) {
                      return Slider(
                        activeColor: CustomColors.primary,
                        min: 16,
                        max: 35,
                        value: controller.fontSize,
                        onChanged: controller.changeFontSize);
                    }
                  ),
                ),
                ///Page Content
                SizedBox(
                  width: Get.width,
                  height: Get.height * 0.75,
                  child: PageView(
                    onPageChanged: (int index) {
                      controller.changeBoardingPage(index);
                    },
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    controller: controller.pageController,
                    children:
                    List.generate(604, (index) {
                      return GetBuilder<DetailsController>(
                          builder: (_) {
                            return SingleChildScrollView(
                              child: Wrap(
                                  children: List.generate(controller.ayahs.length, (index) =>
                                      GestureDetector(
                                        onTap: (){
                                          controller.onAyaSelected(index);
                                        },
                                        child: CustomText(
                                          text:
                                          '${controller.ayahs[index].text!} ﴿${controller.ayahs[index].numberInSurah}﴾ ',
                                          fontSize: controller.fontSize,
                                          textColor: controller.ayahs[index].selected? Colors.red : Colors.black,
                                        ),
                                      )
                                  )),
                            );
                          }
                      );
                    }),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
