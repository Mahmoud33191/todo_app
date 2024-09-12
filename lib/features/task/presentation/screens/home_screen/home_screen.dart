import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';

import '../../component/home_screen/floating_action_component.dart';
import '../../component/home_screen/no_task_component.dart';
import '../../component/home_screen/tasks_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //fab
        floatingActionButton: FloatingActionButtonComponent(),

        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
            final cubit = BlocProvider.of<TaskCubit>(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //date now
                Row(
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 24),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: (){
                        cubit.changeTheme();

                      },
                      icon: Icon(
                        cubit.isDark ?  Icons.mode_night : Icons.mode_night_outlined ,
                        color:  cubit.isDark ? AppColors.white : AppColors.background,
                        size: 30,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 12.h,
                ),

                //today
                Text(
                  AppStrings.today,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24),
                ),

                SizedBox(
                  height: 6.h,
                ),

                //date picker
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  height: 110.h,
                  width: 60.w,
                  dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                  monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                  dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                  selectionColor: AppColors.primary,
                  selectedTextColor: AppColors.white,
                  onDateChange: (date) {
                    // New date selected
                    cubit.getSelectedDate(date);
                  },
                ),

                SizedBox(
                  height: 6.h,
                ),

                // no tasks ? task
                cubit.tasksList.isEmpty
                    ? const Align(
                        alignment: Alignment.center,
                        child: NoTasksWidget(),
                      )
                    : Tasks(cubit: cubit),
              ],
            );
          }),
        ),
      ),
    );
  }
}
