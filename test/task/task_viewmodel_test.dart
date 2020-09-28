
import 'dart:async';
import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/usecase/CreateTask.dart';
import 'package:todolist/domain/usecase/GetTask.dart';
import 'package:todolist/domain/usecase/UpdateTask.dart';
import 'package:todolist/domain/utils/Constant.dart';
import 'package:todolist/presentation/task_list/TaskViewModel.dart';

class MockGetTask extends Mock
    implements GetTask {}
class MockCreateTask extends Mock
    implements CreateTask {}
class MockUpdateTask extends Mock
    implements UpdateTask {}
final getTask = MockGetTask();
final createTask = MockCreateTask();
final updateTask = MockUpdateTask();
    TaskViewModel taskViewModel;
void main() {
  setUp(() {
    taskViewModel = TaskViewModel(getTask, updateTask, createTask);
  });
  group('create-update task', (){
    Exception e = new Exception();
    final task = new Task(null, "test homework", "05/10/2020 08:10", false);
    test("create task successfully", () async {
      when(createTask.execute(task)).thenAnswer((_)=>Future.value(Void));
      scheduleMicrotask(() {
        taskViewModel.create(task);
      });
      await expectLater(
          taskViewModel.createTask, emits(Void));
    });
    test("create task failure", () async {
      when(createTask.execute(task)).thenThrow(e);
      scheduleMicrotask(() {
        taskViewModel.create(task);
      });
      await expectLater(
          taskViewModel.createTask, emitsError(e));
    });

    test("update task successfully", () async {
      when(updateTask.execute(task)).thenAnswer((_)=>Future.value(Void));
      scheduleMicrotask(() {
        taskViewModel.updateTask(task);
      });
      await expectLater(
          taskViewModel.createTask, emits(Void));
    });
    test("update task failure", () async {
      when(updateTask.execute(task)).thenThrow(e);
      scheduleMicrotask(() {
        taskViewModel.updateTask(task);
      });
      await expectLater(
          taskViewModel.createTask, emitsError(e));
    });
  });
  group('get task successfully', () {
    final List<Task> tasks = new List.filled(10, new Task(null, "aaaaa", "12/10/2020 08:50", false));
    test("get all task successfully and show task", () async {
        when(getTask.execute(Constant.ALL)).thenAnswer((_)=>Future.value(tasks));
        scheduleMicrotask(() {
          taskViewModel.getAllTask();
        });
         await expectLater(
             taskViewModel.taskAllList, emits(tasks));
      });

      test("get completed task successfully and show task", () async {
        when(getTask.execute(Constant.COMPLETED)).thenAnswer((_)=>Future.value(tasks));
        scheduleMicrotask(() {
          taskViewModel.getCompletedTask();
        });
        await expectLater(
            taskViewModel.taskCompletedList, emits(tasks));
      });

      test("get in-completed task successfully and show task", () async {
        when(getTask.execute(Constant.INCOMPLETED)).thenAnswer((_)=>Future.value(tasks));
        scheduleMicrotask(() {
          taskViewModel.getInCompletedTask();
        });
        await expectLater(
            taskViewModel.taskInCompletedList, emits(tasks));
      });
  });

  group('get task failure', () {
    Exception e = new Exception();
    test("get all task failure and show error", () async {
      when(getTask.execute(Constant.ALL)).thenThrow(e);
      scheduleMicrotask(() {
        taskViewModel.getAllTask();
      });
      await expectLater(
          taskViewModel.taskAllList, emitsError(e));
    });

    test("get completed task failure and show error", () async {
      when(getTask.execute(Constant.COMPLETED)).thenThrow(e);
      scheduleMicrotask(() {
        taskViewModel.getCompletedTask();
      });
      await expectLater(
          taskViewModel.taskCompletedList, emitsError(e));
    });

    test("get in-completed task failure and show error", () async {
      when(getTask.execute(Constant.INCOMPLETED)).thenThrow(e);
      scheduleMicrotask(() {
        taskViewModel.getInCompletedTask();
      });
      await expectLater(
          taskViewModel.taskInCompletedList, emitsError(e));
    });
  });
}