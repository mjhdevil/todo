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
      // bottomSheet: ListView.builder(
      //     itemCount: todos.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Dismissible(
      //         // 삭제 버튼 및 기능 추가
      //           key: Key(todos[index]),
      //           child: Card(
      //               elevation: 4,
      //               margin: EdgeInsets.all(8),
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(8)),
      //               child: ListTile(
      //                 title: Text(TodoItem[index]),
      //                 trailing: IconButton(
      //                     icon: Icon(Icons.delete, color: Colors.red),
      //                     onPressed: () {
      //                       setState(() {
      //                         TodoItem.removeAt(index);
      //                       });
      //                     }),
      //               )));
      //     }),
          );
  }
}


