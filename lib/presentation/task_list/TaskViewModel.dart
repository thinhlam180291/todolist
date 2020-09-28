

import 'dart:ffi';

import 'package:rxdart/rxdart.dart';
import 'package:todolist/data/repository/TaskLocalDataSourceImpl.dart';
import 'package:todolist/data/repository/TaskRepositoryImpl.dart';
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/usecase/CreateTask.dart';
import 'package:todolist/domain/usecase/GetTask.dart';
import 'package:todolist/domain/usecase/UpdateTask.dart';
import 'package:todolist/domain/utils/Constant.dart';

class TaskViewModel{
  GetTask _getTask;
  CreateTask _createTask;
  UpdateTask _updateTask;
  TaskViewModel(){
    final taskLocalDataSource = new TaskLocalDataSourceImpl();
    final taskRepository = new TaskRepositoryImpl(taskLocalDataSource);
    _getTask = new GetTask(taskRepository);
    _createTask = new CreateTask(taskRepository);
    _updateTask = new UpdateTask(taskRepository);
  }

  var listTaskAllSubject = PublishSubject<List<Task>>();
  var listTaskCompletedSubject = PublishSubject<List<Task>>();
  var listTaskInCompletedSubject = PublishSubject<List<Task>>();
  var createTaskSubject = PublishSubject<void>();

  Stream<List<Task>> get taskAllList => listTaskAllSubject.stream;
  Stream<List<Task>> get taskCompletedList => listTaskCompletedSubject.stream;
  Stream<List<Task>> get taskInCompletedList => listTaskInCompletedSubject.stream;
  Stream<void> get createTask => createTaskSubject.stream;


  void getAllTask() async{
    try {
      listTaskAllSubject.sink.add(await _getTask.execute(Constant.ALL));
    } catch (e) {
      print(e.toString());
      listTaskAllSubject.sink.addError(e);
    }
  }

  void getCompletedTask() async{
    try {
      listTaskCompletedSubject.sink.add(await _getTask.execute(Constant.COMPLETED));
    } catch (e) {
      listTaskCompletedSubject.sink.addError(e);
    }
  }

  void getInCompletedTask() async{
    try {
      listTaskInCompletedSubject.sink.add(await _getTask.execute(Constant.INCOMPLETED));
    } catch (e) {
      listTaskInCompletedSubject.sink.addError(e);
    }
  }

  void create(Task task) async{
    try {
      await _createTask.execute(task);
      createTaskSubject.sink.add(Void);
      getAllTask();
      getInCompletedTask();
    } catch (e) {
      print(e.toString());
      createTaskSubject.sink.addError(e);
    }
  }

  void updateTask(Task task) async{
    try {
      await _updateTask.execute(task);
      createTaskSubject.sink.add(Void);
      getAllTask();
      getCompletedTask();
      getInCompletedTask();
    } catch (e) {
      print(e.toString());
      createTaskSubject.sink.addError(e);
    }
  }

  void closeObservable() {
    listTaskAllSubject.close();
    listTaskCompletedSubject.close();
    listTaskInCompletedSubject.close();
    createTaskSubject.close();

  }
}

