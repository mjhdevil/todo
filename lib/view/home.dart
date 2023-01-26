import 'package:flutter/material.dart';
import 'package:todo/view/card.dart';
import 'package:todo/view/main_calendar.dart';
import 'package:todo/view/schedule_bottomsheet.dart';
import 'package:todo/view/today_check.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showBottomSheet(
            context: context,
            builder: (_) => ScheduleBottomSheet(),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8),
            ToDayCheck(selectedDate: selectedDate,
              count: 0,
            ),
            HomeCard(
                startTime: 12,
                endTime: 14,
                content: '신짱구')
          ],
        ),
      ),
    );
  }


  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}


