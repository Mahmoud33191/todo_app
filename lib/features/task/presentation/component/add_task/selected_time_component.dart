
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../cubit/task_cubit.dart';
import 'add_task_component.dart';

class SelectedTimeComponent extends StatelessWidget {
  const SelectedTimeComponent({
    super.key,
    required this.cubit,
  });

  final TaskCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //! Date start
        Expanded(
          child: AddTaskComponent(
            title: AppStrings.startTime,
            hintText: cubit.startTime,
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () async {
                cubit.getStartTime(context);
              },
              icon: Icon(
                Icons.timer_outlined,
                color: cubit.isDark
                    ? AppColors.white
                    : AppColors.background,
              ),
            ),
          ),
        ),

        SizedBox(
          width: 26.w,
        ),

        //! Date end
        Expanded(
          child: AddTaskComponent(
            title: AppStrings.endTime,
            hintText: cubit.endTime,
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () async {
                cubit.getEndTime(context);
              },
              icon: Icon(
                Icons.timer_outlined,
                color: cubit.isDark
                    ? AppColors.white
                    : AppColors.background,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
