import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/view/homeadd.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  List TodoItem = [];
  String Todo = "";

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      body: TableCalendar(
            focusedDay: _focusedDay ?? DateTime.now(),
            firstDay: DateTime(2023),
            lastDay: DateTime(2024),
            calendarFormat: CalendarFormat.month,
            // 달 로 보여주기
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),

              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              )
            ),

            selectedDayPredicate: (day){
                return isSameDay(_selectedDay,day);
            },
            onDaySelected: (selectedDay, focusedDay){
                if(!isSameDay(_selectedDay, selectedDay)){
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    // 선택한 날짜
                  });
                }
            },
          ),


      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(HomeAdd()),
        child: Icon(Icons.add),
            ),
          );
  }
}


