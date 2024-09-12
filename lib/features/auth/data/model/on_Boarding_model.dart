
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imgPath,
    required this.title,
    required this.subTitle,
  });

  static List<OnBoardingModel> onBoardingScreen =
  [
    OnBoardingModel(
      imgPath: AppAssets.onBoardingImage1,
      title: AppStrings.onBoardingTitleOne,
      subTitle: AppStrings.onBoardingSubTitleOne,
    ),

    OnBoardingModel(
      imgPath: AppAssets.onBoardingImage2,
      title: AppStrings.onBoardingTitleTwo,
      subTitle: AppStrings.onBoardingSubTitleTwo,
    ),


    OnBoardingModel(
      imgPath: AppAssets.onBoardingImage3,
      title: AppStrings.onBoardingTitleThree,
      subTitle: AppStrings.onBoardingSubTitleThree,
    ),
  ];
}
