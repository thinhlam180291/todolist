
import 'package:todolist/data/db/AppDatabase.dart';
import 'package:todolist/data/db/TaskDao.dart';
import 'package:todolist/data/repository/TaskDataSource.dart';
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/utils/Constant.dart';

class TaskLocalDataSourceImpl extends TaskDataSource{
  
  TaskDao taskDao;

  @override
  Future<List<Task>> getTask(int status) async {
    if(taskDao == null) {
      final appDataBase = await $FloorAppDatabase
          .databaseBuilder('todolist_database.db')
          .build();
      this.taskDao = appDataBase.taskDao;
    }
    switch (status){
      case Constant.ALL:
        return taskDao.getAllTask();
      case Constant.COMPLETED:
        return taskDao.getTask(true);
      default:
        return taskDao.getTask(false);
    }
  }

  @override
  Future<void> saveTask(Task task) async {
    if(taskDao == null) {
      final appDataBase = await $FloorAppDatabase
          .databaseBuilder('todolist_database.db')
          .build();
      this.taskDao = appDataBase.taskDao;
    }
    taskDao.insertTask(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    if(taskDao == null) {
      final appDataBase = await $FloorAppDatabase
          .databaseBuilder('todolist_database.db')
          .build();
      this.taskDao = appDataBase.taskDao;
    }
    return taskDao.updateTask(task);
  }

}