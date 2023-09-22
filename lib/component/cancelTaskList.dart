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

  _showAlertDialog(id) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are You Sure?'),
          content: Text('Task will Not retrived if you delete it!!'),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                await DeleteTaskRequest(id);
                await CallData();
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Loading?(Center(child: CircularProgressIndicator(),))
        :
    RefreshIndicator(child: TaskList(TaskItems,_showAlertDialog), onRefresh: () async{
      await CallData();
    });
  }
}