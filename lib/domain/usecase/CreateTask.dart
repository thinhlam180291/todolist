

import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/repository/TaskRepository.dart';

class CreateTask{
  TaskRepository taskRepository;
  CreateTask(TaskRepository taskRepository)
  {
    this.taskRepository = taskRepository;
  }
  Future<void> execute(Task task){
    return taskRepository.createTask(task);
  }
}