
import 'package:flutter/material.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../screens/add_task_screen/add_task_screen.dart';

class FloatingActionButtonComponent extends StatelessWidget {
  const FloatingActionButtonComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () {
        navigatePushScreen(
          context: context,
          screen: AddTaskScreen(),
        );
      },
      child: const Icon(
        Icons.add,
        size: 32,
      ),
    );
  }
}

