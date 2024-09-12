import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //image
        Image.asset(
          AppAssets.noTasks,
        ),

        SizedBox(
          height: 10.h,
        ),

        //noTaskTitle
        Text(
          AppStrings.noTaskTitle,
          style:
          Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
        ),

        SizedBox(
          height: 10.h,
        ),

        //noTaskSubTitle
        Text(
          AppStrings.noTaskSubTitle,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
