
import 'package:todolist/domain/model/Task.dart';

abstract class TaskDataSource
{
  Future<List<Task>> getTask(int status);

  Future<void> saveTask(Task task);

  Future<void> updateTask(Task task);

}