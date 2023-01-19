import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      body: Column(
        children: [
          TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2023),
              lastDay: DateTime(2024),
          )
        ],
      ),
    );
  }
}

