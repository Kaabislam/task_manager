// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task_manager/screen/onboarding/emailVerificationScreen.dart';
import 'package:task_manager/screen/onboarding/loginScreen.dart';
import 'package:task_manager/screen/onboarding/pinVerificationScreen.dart';
import 'package:task_manager/screen/onboarding/registrationScreen.dart';
import 'package:task_manager/screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager/screen/task/homeScreen.dart';
import 'package:task_manager/screen/task/taskCreateScreen.dart';
import 'package:task_manager/utility/utitlity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');
  if (token == null) {
    runApp(MyApp('/login'));
  } else {
    runApp(MyApp('/login'));
  }
}

class MyApp extends StatelessWidget {
  String currentWindow;
  MyApp(this.currentWindow, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: currentWindow,
      routes: {
        '/': (context) => const homeScreen(),
        '/login': (context) => const loginScreen(),
        '/registration': (context) => const registrationScreen(),
        '/emailVerification': (context) => const emailVerificationScreen(),
        '/pinVerification': (context) => const pinVerificationScreen(),
        '/setPassword': (context) => const setPasswordScreen(),
        '/createTask': (context) => const taskCreateScreen(),
      },
    );
  }
}
