
import 'package:floor/floor.dart';
import 'package:todolist/domain/model/Task.dart';

@dao
abstract class TaskDao {

  @Query('SELECT * FROM Task')
  Future<List<Task>> getAllTask();

  @Query('SELECT * FROM Task WHERE status = :status')
  Future<List<Task>> getTask(bool status);

  @insert
  Future<void> insertTask(Task task);

  @update
  Future<void> updateTask(Task task);

}

