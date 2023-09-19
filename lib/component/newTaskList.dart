import 'package:flutter/cupertino.dart';

class newTaskList extends StatefulWidget{
  const newTaskList({Key? key}):super(key:key);
  @override
  State<newTaskList> createState() => _newTaskListState();


}

class _newTaskListState extends State<newTaskList> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("new task list"),
    );
  }
}