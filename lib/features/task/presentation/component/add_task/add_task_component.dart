import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.validator,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
         SizedBox(
          height: 8.h,
        ),
        BlocBuilder<TaskCubit,TaskState>(
          builder: (context,state) {
            final cubit = BlocProvider.of<TaskCubit>(context);

            return TextFormField(
              readOnly: readOnly,
              controller: controller,
              validator: validator,
              style:  TextStyle(
                color: cubit.isDark ? AppColors.white : AppColors.background,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: suffixIcon,
              ),
            );
          }
        ),
      ],
    );
  }
}
