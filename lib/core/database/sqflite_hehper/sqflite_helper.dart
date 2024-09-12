import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';

class SqfLiteHelper {
  late Database db;

  //1. create DB
  //2. create table
  //3. CRUD => create - read - update - delete

  //! initDatabase
  Future<void> initDB() async {
    // step 1 => create db
    await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (Database db, int version) async {
        // step 2 => create table
        await db.execute('''
        CREATE TABLE Tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, notes TEXT, date TEXT, startTime TEXT, endTime TEXT, color INTEGER, isCompleted INTEGER)
          ''').then((value) => debugPrint("DB created successfully"));
      },
      onOpen: (db) => debugPrint('DB opened'),
    // ignore: invalid_return_type_for_catch_error
    ).then((value) => db = value).catchError((e) => debugPrint(e.toString()));
  }

  //! get
  Future<List<Map<String, Object?>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM Tasks');
  }

  //! insert
  Future<int> insertToDB(TaskModel model) async {
    return await db.rawInsert('''INSERT INTO Tasks(title, notes, date, startTime, endTime, color, isCompleted) 
    VALUES(
    '${model.title}', '${model.note}', '${model.date}', '${model.startTime}',
     '${model.endTime}', '${model.color}', '${model.isCompleted}')''');
  }

  //! update DB
  Future<int> updateDB(int id) async {
    return await db.rawUpdate('''
      UPDATE Tasks 
      SET isCompleted = ?
      WHERE id = ?
      ''', [1, id]);
  }

  //! delete from DB
  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete('''
      DELETE FROM Tasks WHERE id = ?
      ''', [id]);
  }
}
