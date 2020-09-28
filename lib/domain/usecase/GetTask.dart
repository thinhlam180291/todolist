
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/repository/TaskRepository.dart';

class GetTask
{
  TaskRepository taskRepository;
  GetTask(TaskRepository taskRepository)
  {
      this.taskRepository = taskRepository;
  }
  Future<List<Task>> execute(int status){
      return taskRepository.getTask(status);
  }
}