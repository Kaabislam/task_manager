
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/utility/utitlity.dart';

class newTaskListScreen extends StatefulWidget {
  const newTaskListScreen({Key? key}) : super(key: key);

  @override
  State<newTaskListScreen> createState() => _newTaskListScreenState();
}

class _newTaskListScreenState extends State<newTaskListScreen> {
  String email = "";
  @override
  void initState(){
    CallUserData();
    super.initState();
  }
  CallUserData() async {
    String? a = await ReadUserData("email");
    setState(() {
      email = a!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text(email),
      ),
    );
  }
}
