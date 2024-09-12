import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/database/sqflite_hehper/sqflite_helper.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/model/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));

  int currentIndex = 0;

  void getDate(context) async {
    emit(GetDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSucessState());
    } else {
      debugPrint("pickedDate == null");
      emit(GetDateErrorState());
    }
  }

  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      emit(GetStartTimeSucessState());
    } else {
      debugPrint("pickedStartTime == null");
      emit(GetStartTimeErrorState());
    }
  }

  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());

    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(GetEndTimeSucessState());
    } else {
      debugPrint("pickedStartTime == null");
      emit(GetEndTimeErrorState());
    }
  }

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

  void changeCheckMarkIndex(index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

  void insertTask() async {
    emit(InsertTaskLoadingState());
    //await Future.delayed(const Duration(seconds: 3));

    try {
      await sl<SqfLiteHelper>().insertToDB(
        TaskModel(
          title: titleController.text,
          note: noteController.text,
          startTime: startTime,
          endTime: endTime,
          date: DateFormat.yMd().format(currentDate),
          isCompleted: 0,
          color: currentIndex,
        ),
      );
      getTasks();

      titleController.clear();
      noteController.clear();
      // currentDate = DateTime.now();
      // currentIndex = 0;

      emit(InsertTaskSuccessState());
    } catch (e) {
      //log(e.toString());
      emit(InsertTaskErrorState());
    }
  }

  void getSelectedDate(date) {
    emit(GetSelectedDateLoadingState());
    selectedDate = date;
    emit(GetSelectedDateSuccessState());
    getTasks();


  }

  List<TaskModel> tasksList = [];

  void getTasks() async {
    emit(GetTaskLoadingState());
    try {
      final value = await sl<SqfLiteHelper>().getFromDB();
      print(value.toString());

      tasksList = value
          .map((e) => TaskModel.fromJson(e))
          .toList()
          .where(
            (element) => element.date == DateFormat.yMd().format(selectedDate),
          )
          .toList();
      emit(GetTaskSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GetTaskErrorState());
    }
  }

  //update task
  void updateTask(id) async {
    emit(UpdateTaskLoadingState());
    await sl<SqfLiteHelper>().updateDB(id).then((value) {
      emit(UpdateTaskSuccessState());
      getTasks();
    }).catchError((e) {
      debugPrint(e.toString());
      emit(UpdateTaskErrorState());
    });
  }

  //delete task
  void deleteTask(id) async {
    emit(DeleteTaskLoadingState());
    await sl<SqfLiteHelper>().deleteFromDB(id).then((value) {
      emit(DeleteTaskSuccessState());
      getTasks();
    }).catchError((e) {
      debugPrint(e.toString());
      emit(DeleteTaskErrorState());
    });
  }

  bool isDark = false ;
  void changeTheme()async{
    isDark = !isDark ;
    await sl<CacheHelper>().saveData(key: 'isDark', value: isDark);
    emit(ChangeThemeState());
  }

  void getTheme()async{
    isDark = await sl<CacheHelper>().getData(key: 'isDark');
    emit(GetThemeState());
  }
}
