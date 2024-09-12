import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/core/widgets/custom_text_button.dart';
import 'package:to_do_app/features/auth/data/model/on_Boarding_model.dart';
import 'package:to_do_app/features/task/presentation/screens/home_screen/home_screen.dart';

import '../../../../../core/services/service_locator.dart';

class OnBoardingScreens extends StatelessWidget {
   OnBoardingScreens({super.key});

   final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: PageView.builder(
            controller: controller,
            itemCount: OnBoardingModel.onBoardingScreen.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  //skip text
                  index != 2
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            text: AppStrings.skip,
                          ),
                        )
                      :  SizedBox(
                          height: 54.h,
                        ),

                   SizedBox(
                    height: 16.h,
                  ),

                  //image
                  Image.asset(
                    OnBoardingModel.onBoardingScreen[index].imgPath,
                  ),

                   SizedBox(
                    height: 16.h,
                  ),

                  //dotes
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotHeight: 8,
                      spacing: 8,
                    ),
                  ),

                   SizedBox(
                    height: 50.h,
                  ),

                  //title
                  Text(
                    OnBoardingModel.onBoardingScreen[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),

                   SizedBox(
                    height: 42.h,
                  ),

                  //subtitle
                  Text(
                    OnBoardingModel.onBoardingScreen[index].subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                   SizedBox(
                    height: 107.h,
                  ),

                  //buttons
                  Row(
                    children: [
                      //back button
                      index != 0
                          ? CustomTextButton(
                              text: AppStrings.back,
                              onPressed: () {
                                controller.previousPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                            )
                          : Container(),

                      const Spacer(),

                      //next button
                      index != 2
                          ? CustomElevatedButton(
                              text: AppStrings.next,
                              onPressed: () {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                            )
                          : CustomElevatedButton(
                              text: AppStrings.getStarted,
                              onPressed: () async {
                                // Navigate to home screen
                                await sl<CacheHelper>()
                                    .saveData(
                                        key: AppStrings.onBoardingKey,
                                        value: true)
                                    .then((value) {
                                  navigateScreen(
                                    context: context,
                                    screen: const HomeScreen(),
                                  );
                                }).catchError((e) {
                                  debugPrint(e.toString());
                                });
                              },
                            ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
