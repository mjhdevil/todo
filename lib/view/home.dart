import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now(); // 현재 날짜
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2023), // 시작하는 년도 / 현재 월 전에는 안나옴 수정해야함 ★★★
              lastDay: DateTime(2024), // 마지막 년도
            onDaySelected: (selectedDay, focusedDay){
                if(!isSameDay(_selectedDate, selectedDay)){
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
            },
          )
        ],
      ),
    );
  }
}
