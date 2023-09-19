
import 'package:flutter/cupertino.dart';

class progressTaskList extends StatefulWidget{
  const progressTaskList({Key? key}):super(key:key);
  @override
  State<progressTaskList> createState() => _progressTaskListState();


}

class _progressTaskListState extends State<progressTaskList> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("progress task list"),
    );
  }
}