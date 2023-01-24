import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  // DateTime? _selectedDay;
  // DateTime? _focusedDay;
   List TodoItem = [];
   String Todo = "";

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  DateTime today = DateTime.now();


  @override
  void initState() {
    super.initState();
    TodoItem.add("흰둥이");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      body: TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2023),
            lastDay: DateTime(2024),
            calendarFormat: _calendarFormat,
            
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              // 선택한 날짜 

              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              )
            ),
            // 오늘날짜

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
        onFormatChanged: (format){
              if(_calendarFormat != format){
                setState(() {
                  _calendarFormat = format;
                });
              }
        },
        onPageChanged: (focusedDay){
              _focusedDay = focusedDay;
        },
          ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("할일"),
                    content: TextField(
                      onChanged: (String value) {
                        Todo = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            setState(() {
                              TodoItem.add(Todo);
                              Get.back();
                              //Navigator.of(context).pop();
                            });

                          },
                          child: Text("등록")),
                      TextButton(
                          onPressed: () {
                            setState(() {});
                            Get.back(); // 닫기
                          },
                          child: Text("닫기")),
                    ]);
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
          );
  }
}


