
import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';

BottomNavigationBar appBottomNav(currentIndex,onItemTapped){
  return BottomNavigationBar(
      selectedItemColor: colorGreen,
      unselectedItemColor: colorLightGray,
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "New",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
          label: "Progress",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outlined),
          label: "Completed",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cancel_outlined),
          label: "Canceled",
        ),

      ]

  );
}