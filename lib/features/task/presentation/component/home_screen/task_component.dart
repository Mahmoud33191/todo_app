
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/model/task_model.dart';
import '../../cubit/task_cubit.dart';
import '../../cubit/task_state.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.purple;
      default:
        return AppColors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 128.h,
      decoration: BoxDecoration(
        color: getColor(taskModel.color),
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title task
                  Text(
                    taskModel.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 24),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),

                  //time picker
                  Row(
                    children: [
                      BlocBuilder<TaskCubit,TaskState>(
                          builder: (context,state) {
                            final cubit = BlocProvider.of<TaskCubit>(context);
                            return  Icon(
                              Icons.timer_outlined,
                              color: cubit.isDark ? AppColors.white : AppColors.background,
                            );
                          }
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      //time
                      Text(
                        "${taskModel.startTime}- ${taskModel.endTime}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 8.h,
                  ),

                  // subtitle task
                  Text(
                    taskModel.note,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),

            // divider
            Container(
              height: 75.h,
              width: 1.w,
              color: AppColors.white,
            ),

            SizedBox(
              width: 9.w,
            ),

            //text
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                taskModel.isCompleted == 1
                    ? AppStrings.completed
                    : AppStrings.toDo,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
