


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/domain/model/Task.dart';
import 'package:todolist/domain/utils/Constant.dart';

class TaskListUtils{
  static Widget buildListViewNoDataWidget() {
    return Container(
      child: Center(
        child: Text("No Data Available"),
      ),
    );
  }


}