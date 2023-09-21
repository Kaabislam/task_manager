
import 'package:flutter/material.dart';
import 'package:task_manager/utility/utitlity.dart';

AppBar TaskAppBar(context){
  return AppBar(
    flexibleSpace: Container(),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createTask');
          },
          icon: Icon(Icons.add_circle_outline)),

      IconButton(onPressed: () async{
        await RemoveToken();
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }, icon: Icon(Icons.output))
    ],
 );
}