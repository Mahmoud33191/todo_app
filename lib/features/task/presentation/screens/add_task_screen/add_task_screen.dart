import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/features/task/presentation/component/add_task/add_task_component.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';
import 'package:to_do_app/features/task/presentation/screens/home_screen/home_screen.dart';

import '../../component/add_task/app_bar_component.dart';
import '../../component/add_task/selected_color_widget.dart';
import '../../component/add_task/selected_date_component.dart';
import '../../component/add_task/selected_time_component.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarComponent(context),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlocConsumer<TaskCubit, TaskState>(
                listener: (context, state) {
                  if (state is InsertTaskSuccessState) {
                    navigateScreen(
                        context: context, screen: const HomeScreen());
                  }
                  if (state is InsertTaskLoadingState) {
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = BlocProvider.of<TaskCubit>(context);
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! Title
                        AddTaskComponent(
                          controller: cubit.titleController,
                          title: AppStrings.title,
                          hintText: AppStrings.titleHint,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.titleErrorMsg;
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 24.h,
                        ),

                        //! Note
                        AddTaskComponent(
                          controller: cubit.noteController,
                          title: AppStrings.note,
                          hintText: AppStrings.noteHint,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.noteErrorMsg;
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 24.h,
                        ),

                        //! Date
                        SelectedDateComponent(cubit: cubit),

                        SizedBox(
                          height: 24.h,
                        ),

                        //! start - end time
                        SelectedTimeComponent(cubit: cubit),

                        SizedBox(
                          height: 24.h,
                        ),

                        //! Color
                        SelectedColorWidget(cubit: cubit),

                        SizedBox(
                          height: 94.h,
                        ),

                        //! Add task button
                        SizedBox(
                          height: 48.h,
                          width: double.infinity,
                          child: CustomElevatedButton(
                            text: AppStrings.createTask,
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.insertTask();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
