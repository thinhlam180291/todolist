
import 'package:todolist/domain/model/Task.dart';

abstract class TaskRepository{
  Future<List<Task>> getTask(int status);
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);

}
