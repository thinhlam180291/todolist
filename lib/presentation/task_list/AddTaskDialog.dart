import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/utils/Constant.dart';
import 'package:todolist/generated/l10n.dart';
import 'package:todolist/presentation/task_list/TaskViewModel.dart';

class AddTaskDialog extends StatelessWidget {

  final TaskViewModel taskViewModel;
  AddTaskDialog(this.taskViewModel);

  final desController = TextEditingController();
  final timeController = TextEditingController();

  dialogContent(BuildContext context) {
    return Container(
      padding:
          new EdgeInsets.only(top: 60.0, left: 48, right: 47, bottom: 60.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
              controller: desController,
              decoration: InputDecoration(hintText: S.current.desciption)),
          TextField(
              controller: timeController,
              decoration: InputDecoration(hintText: S.current.format_time)),
          Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                child: Text(S.current.add_task,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                color: Colors.blueAccent,
                onPressed: () {
                  if(desController.text == "" || timeController.text == ""){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(title: Text(S.current.error_add),
                        children: [
                            Container(
                              padding:
                              new EdgeInsets.only(top: 20.0, left: 48, right: 47, bottom: 20.0),
                              child: RaisedButton(
                                child: Text("OK",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                color: Colors.blueAccent,
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            )
                        ],
                      ),
                    );
                    return;
                  }
                  Task task = new Task(null, desController.text, timeController.text, false);
                  taskViewModel.create(task);
                },
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: dialogContent(context),
      )
    );
  }

}
