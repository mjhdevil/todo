import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller.dart';
import 'package:todo/view/home.dart';
import 'package:todo/view/note.dart';

class NavBar extends StatelessWidget {
  BottomNavigationBarController bottomNavgationBarController =
  Get.put(BottomNavigationBarController());
  NavBar({Key? key}) : super(key: key);

  final screen =[
    Home(),
    Note(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () =>IndexedStack(
          index: bottomNavgationBarController.selectedIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: true, // false 주면 라벨 사라짐
        onTap: (index){
          bottomNavgationBarController.changeIndex(index);
        },
        currentIndex: bottomNavgationBarController.selectedIndex.value,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edit_calendar),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.note),
            label: 'Note',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
