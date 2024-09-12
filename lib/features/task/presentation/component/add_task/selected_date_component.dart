
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../cubit/task_cubit.dart';
import 'add_task_component.dart';

class SelectedDateComponent extends StatelessWidget {
  const SelectedDateComponent({
    super.key,
    required this.cubit,
  });

  final TaskCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AddTaskComponent(
      title: AppStrings.date,
      hintText: DateFormat.yMd().format(cubit.currentDate),
      readOnly: true,
      suffixIcon: IconButton(
        onPressed: () async {
          cubit.getDate(context);
        },
        icon: Icon(
          Icons.calendar_month_outlined,
          color: cubit.isDark
              ? AppColors.white
              : AppColors.background,
        ),
      ),
    );
  }
}
