
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:todolist/data/db/TaskDao.dart';
import 'package:todolist/domain/model/Task.dart';

part 'AppDatabase.g.dart';

@Database(version: 1, entities: [Task])
abstract class AppDatabase extends FloorDatabase{
  TaskDao get taskDao;
}
