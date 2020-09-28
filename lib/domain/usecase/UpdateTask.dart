
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/repository/TaskRepository.dart';

class UpdateTask{
  TaskRepository taskRepository;
  UpdateTask(TaskRepository taskRepository)
  {
    this.taskRepository = taskRepository;
  }
  Future<void> execute(Task task){
    return taskRepository.updateTask(task);
  }
}