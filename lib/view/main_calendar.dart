import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      onDaySelected: onDaySelected,
      // 날짜 선택시 실행할 함수
      selectedDayPredicate: (date) =>
      // 선택된 날짜를 구분
      date.year == selectedDate.year &&
      date.month == selectedDate.month &&
      date.day == selectedDate.day,
      focusedDay: DateTime.now(),
      firstDay: DateTime(2023),
      lastDay: DateTime(2024),
      headerStyle: HeaderStyle(
        titleCentered: true,
        // 제목 중앙에 위치
        formatButtonVisible: false,
        // 달력 크기 선택 옵션 없애기
      ),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        )
      ),
    );
  }
}
