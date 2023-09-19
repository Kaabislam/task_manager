

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
class completedTaskList extends StatefulWidget{
  const completedTaskList({Key? key}):super(key:key);
  @override
  State<completedTaskList> createState() => _completedTaskListState();


}

class _completedTaskListState extends State<completedTaskList> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("completed task list"),
    );
  }
}