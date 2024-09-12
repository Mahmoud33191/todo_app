import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/auth/presentation/screens/on_boarding_screens/on_boarding_screens.dart';
import 'package:to_do_app/features/task/presentation/screens/home_screen/home_screen.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    bool isVisited =
        sl<CacheHelper>().getData(key: AppStrings.onBoardingKey) ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      navigateScreen(
        context: context,
        screen: isVisited ? const HomeScreen() : OnBoardingScreens(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
             SizedBox(
              height: 19.h,
            ),
            Text(
              AppStrings.appName,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
