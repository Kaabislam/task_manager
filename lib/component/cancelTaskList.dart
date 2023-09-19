import 'package:flutter/cupertino.dart';

class cancelTaskList extends StatefulWidget{
  const cancelTaskList({Key? key}):super(key:key);
  @override
  State<cancelTaskList> createState() => _cancelTaskListState();


}

class _cancelTaskListState extends State<cancelTaskList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("cancel task list"),
    );
  }
}