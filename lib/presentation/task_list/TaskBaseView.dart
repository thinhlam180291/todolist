

import 'package:flutter/material.dart';

import 'TaskViewModel.dart';

class TaskBaseView extends StatefulWidget{

  @override
  _TaskBaseView createState() => _TaskBaseView();

}
class _TaskBaseView<T extends TaskBaseView> extends State<T> {


  void callApi(){

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      callApi();
    }
  }


  @override
  void initState() {
    super.initState();
    callApi();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

        ));
  }
}
