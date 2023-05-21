import 'package:flutter/material.dart';
import 'package:task_manager/screen/onboarding/emailVerificationScreen.dart';
import 'package:task_manager/screen/onboarding/loginScreen.dart';
import 'package:task_manager/screen/onboarding/pinVerificationScreen.dart';
import 'package:task_manager/screen/onboarding/registrationScreen.dart';
import 'package:task_manager/screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager/screen/onboarding/splashScreen.dart';
import 'package:task_manager/screen/task/newTaskListScreen.dart';
import 'package:task_manager/utility/utitlity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');
  if(token == null){
    runApp(MyApp('/login'));

  }
  else{
    runApp(MyApp('/newTaskList'));

  }
}

class MyApp extends StatelessWidget {
  String currentWindow;
  MyApp(this.currentWindow);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: '/login',
      routes: {
        '/':(context)=>splashScreen(),
        '/login':(context) => loginScreen(),
        '/registration':(context) => registrationScreen(),
        '/emailVerification':(context)=>emailVerificationScreen(),
        '/pinVerification':(context)=>pinVerificationScreen(),
        '/setPassword':(context)=>setPasswordScreen(),
        '/newTaskList':(context)=>newTaskListScreen(),
      },
    );
  }
}