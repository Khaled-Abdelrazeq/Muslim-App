import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_task/modules/components/custom_app_bar.dart';
import 'package:muslim_task/modules/components/custom_text.dart';
import 'package:muslim_task/modules/components/custom_text_form_field.dart';
import 'package:muslim_task/modules/home/components/custom_quran_surah.dart';
import 'package:muslim_task/modules/home/home_controller.dart';
import 'package:muslim_task/shared/styles/custom_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.scaffoldBackground,
        body: Column(
          children: [
            const CustomAppBar(
                isHasBackButton: false,
                title: 'القرآن الكريم',
            ),
            Container(
              height: 30,
              color: CustomColors.primary,
              child: const TabBar(
                // controller: controller.tabController,
                indicatorColor: CustomColors.textColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: 'السور',
                    ),
                    Tab(
                      text: 'المحفوظات'
                    ),
                  ],
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: TabBarView(children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomTextFormField(
                        hint: ' ....ابحث عما تريد',
                        controller: controller.searchController,
                        height: 45,
                        background: CustomColors.textColor,
                        boxShadow: const BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 0.1),
                          blurRadius: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GetBuilder<HomeController>(
                            builder: (_) {
                              return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index){
                                    return CustomQuranSurah(surah: controller.surahs[index],
                                      onSurahTap: (){
                                        controller.onSurahTap(index);
                                      },);
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                                  itemCount: controller.surahs.length);
                            }
                        ),
                      ),
                    )
                  ],
                ),
                ///Saved Ayahs
                GetBuilder<HomeController>(
                  builder: (_) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: GlobalKey(),
                            onDismissed: (direction) {
                              // Remove the item from the data source.
                              controller.deleteSavedAya(index);

                              // Then show a snackbar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(content: Text('Removed!'), duration: Duration(seconds: 1),));
                            },
                            child: GestureDetector(
                              onLongPress: (){
                                controller.deleteSavedAya(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: CustomText(
                                  text: controller.ayahs[index],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: controller.ayahs.length);
                  }
                )
              ],),
            )

          ],
        ),
      ),
    );
  }
}


