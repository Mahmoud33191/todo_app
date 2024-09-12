import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/task/presentation/component/home_screen/task_component.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../cubit/task_cubit.dart';

class Tasks extends StatelessWidget {
  const Tasks({
    super.key,
    required this.cubit,
  });

  final TaskCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cubit.tasksList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //model sheet
              showBottomSheet(context, index);
            },
            child: TaskComponent(
              taskModel: cubit.tasksList[index],
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context, int index) {
    return showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(24),
                  height: 250.h,
                  color: AppColors.deepGrey,
                  child: Column(
                    children: [
                      //taskCompleted
                      cubit.tasksList[index].isCompleted == 1
                          ? Container()
                          : SizedBox(
                              height: 48.h,
                              width: double.infinity,
                              child: CustomElevatedButton(
                                text: AppStrings.taskCompleted,
                                onPressed: () {
                                  cubit.updateTask(cubit.tasksList[index].id);
                                  Navigator.pop(context);
                                },
                              ),
                            ),

                      SizedBox(
                        height: 24.h,
                      ),

                      //deleteCompleted
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: CustomElevatedButton(
                          color: AppColors.red,
                          text: AppStrings.deleteTask,
                          onPressed: () {
                            cubit.deleteTask(cubit.tasksList[index].id);
                            Navigator.pop(context);
                          },
                        ),
                      ),

                      SizedBox(
                        height: 24.h,
                      ),

                      //cancel
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: CustomElevatedButton(
                          text: AppStrings.cancel,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
  }
}
