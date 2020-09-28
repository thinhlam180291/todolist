
import 'package:todolist/data/repository/TaskDataSource.dart';
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/repository/TaskRepository.dart';

class TaskRepositoryImpl extends TaskRepository{

  TaskDataSource taskDataSource;
  TaskRepositoryImpl(TaskDataSource dataSource){
      this.taskDataSource = dataSource;
  }
  @override
  Future<List<Task>> getTask(int status) {
    return taskDataSource.getTask(status);
  }

  @override
  Future<void> createTask(Task task) {
     return taskDataSource.saveTask(task);
  }

  @override
  Future<void> updateTask(Task task) {
    return taskDataSource.updateTask(task);
  }



}
