import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

AppBar appBarComponent(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.primary,
      ),
    ),
    centerTitle: false,
    title: Text(
      AppStrings.addTask,
      style: Theme.of(context).textTheme.displayLarge,
    ),
  );
}