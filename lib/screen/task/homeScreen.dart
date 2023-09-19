
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/component/appBottomNav.dart';
import 'package:task_manager/component/cancelTaskList.dart';
import 'package:task_manager/component/completedTaskList.dart';
import 'package:task_manager/component/newTaskList.dart';
import 'package:task_manager/component/progressTaskList.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int TabIndex = 1;
  onItemTapped(int index){
    setState(() {
      TabIndex = index;
    });
  }
  final widegetOptions=[
    newTaskList(),
    progressTaskList(),
    completedTaskList(),
    cancelTaskList()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widegetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex,onItemTapped),
    );
  }
}
