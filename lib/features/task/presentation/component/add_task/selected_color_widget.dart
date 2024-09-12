
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../cubit/task_cubit.dart';

class SelectedColorWidget extends StatelessWidget {
  const SelectedColorWidget({
    super.key,
    required this.cubit,
  });

  final TaskCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.color,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 8.h,
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(
                      width: 8.w,
                    ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      cubit.changeCheckMarkIndex(index);
                    },
                    child: CircleAvatar(
                      backgroundColor: cubit.getColor(index),
                      child: index == cubit.currentIndex
                          ? const Icon(Icons.check)
                          : null,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
