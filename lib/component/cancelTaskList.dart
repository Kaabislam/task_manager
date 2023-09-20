import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/component/TaskList.dart';

import '../api/apiClient.dart';


class cancelTaskList extends StatefulWidget{
  const cancelTaskList({Key? key}):super(key:key);
  @override
  State<cancelTaskList> createState() => _cancelTaskListState();


}

class _cancelTaskListState extends State<cancelTaskList> {
  List TaskItems=[];
  bool Loading=true;

  @override
  void initState(){
    CallData();
    super.initState();
  }

  CallData() async{
    var data= await TaskListRequest("Canceled");
    setState(() {
      Loading=false;
      TaskItems = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Loading?(Center(child: CircularProgressIndicator(),))
        :
    RefreshIndicator(child: TaskList(TaskItems), onRefresh: () async{
      await CallData();
    });
  }
}