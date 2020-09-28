

import 'package:flutter/material.dart';
import 'package:todolist/data/db/TaskDao.dart';
import 'package:todolist/data/repository/TaskLocalDataSourceImpl.dart';
import 'package:todolist/data/repository/TaskRepositoryImpl.dart';
import 'package:todolist/domain/usecase/CreateTask.dart';
import 'package:todolist/domain/usecase/GetTask.dart';
import 'package:todolist/domain/usecase/UpdateTask.dart';
import 'package:todolist/generated/l10n.dart';
import 'package:todolist/presentation/task_list/AddTaskDialog.dart';
import 'package:todolist/presentation/task_list/AllTask.dart';
import 'package:todolist/presentation/task_list/CompletedTask.dart';
import 'package:todolist/presentation/task_list/InCompletedTask.dart';
import 'package:todolist/presentation/task_list/TaskViewModel.dart';

class TaskList extends StatefulWidget{

  @override
  _TaskList createState() => _TaskList();

}
class _TaskList extends State<TaskList>{
  int selectedIndex = 0;

  List pages;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskRepository = new TaskRepositoryImpl(new TaskLocalDataSourceImpl());
    final taskViewModel = new TaskViewModel(new GetTask(taskRepository), new UpdateTask(taskRepository), new CreateTask(taskRepository));
    pages = <Widget>[
      new AllTask(taskViewModel),
      new CompletedTask(taskViewModel),
      new InCompletedTask(taskViewModel)];
    return MaterialApp(

      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: Text(S.of(context).app_name)
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  title: Text(S.of(context).all),
                  icon: Icon(null)
              ),
              BottomNavigationBarItem(
                  title: Text(S.of(context).completed),
                  icon: Icon(null)
              ),
              BottomNavigationBarItem(
                  title: Text(S.of(context).in_completed),
                  icon: Icon(null)

              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AddTaskDialog(taskViewModel),
              );
            },
            child: Icon(Icons.exposure_plus_1),
            backgroundColor: Colors.green,
          ),
          body: pages.elementAt(selectedIndex),
        ),
      ),
    );
  }
}


