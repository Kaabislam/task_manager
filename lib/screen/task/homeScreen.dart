
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/component/appBottomNav.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int bottomTabIndex = 1;
  onItemTapped(int index){
    setState(() {
      bottomTabIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      bottomNavigationBar: appBottomNav(bottomTabIndex,onItemTapped),
    );
  }
}
