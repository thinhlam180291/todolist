import 'package:flutter/material.dart';
import 'package:todolist/data/db/TaskDao.dart';
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/presentation/task_list/TaskViewModel.dart';
import 'package:todolist/presentation/utils/TaskListUltils.dart';

class AllTask extends StatefulWidget {
  AllTask(this.taskViewModel, {Key key, this.title}) : super(key: key);
  final String title;
  final TaskViewModel taskViewModel;

  @override
  _AllTask createState() => _AllTask(taskViewModel);
}

class _AllTask extends State<AllTask> {
  final TaskViewModel taskViewModel;

  _AllTask(this.taskViewModel);

  @override
  void initState() {
    super.initState();
    taskViewModel.getAllTask();

  }
  @override
  void dispose() {
    taskViewModel.closeObservable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Task>>(
        stream: taskViewModel.taskAllList,
        builder: (context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasError) {
            return TaskListUtils.buildListViewNoDataWidget();
          } else {
            if(snapshot.hasData && snapshot.data.length>0){
              return buildListViewWidget(snapshot.data);
            }else{
              return TaskListUtils.buildListViewNoDataWidget();
            }
          }
        }
    );
  }
  Widget buildListViewWidget(List<Task> taskList) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.fromLTRB(16.0,2.0,16.0,2.0),
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  child:
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: taskList[index].status,
                                        onChanged: (bool value) {
                                          setState(() {
                                            taskList[index].status = !taskList[index].status;
                                            taskViewModel.updateTask(taskList[index]);

                                          });
                                        },
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            taskList[index].description,
                                            style:
                                            TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: Text(
                                              taskList[index].time,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )


                                )),
                          ],
                        ),
                      ],
                    )))
        );
      },
      itemCount: taskList.length,
    );
  }
}
