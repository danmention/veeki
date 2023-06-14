// import 'package:flutter/material.dart';
// import 'package:veeki/utils/global.colors.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class Calender extends StatefulWidget {
//   const Calender({Key? key}) : super(key: key);
//
//   @override
//   State<Calender> createState() => _CalenderState();
// }
//
// class _CalenderState extends State<Calender> {
//   DateTime today = DateTime.now();
//   void _onDaySelected(DateTime day, DateTime focusedDay){
//     setState(() {
//       today = day;
//       print(day);
//     });
//   }
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Column(
//           children: [
//             //Text("Selected Day = " + today.toString().split("")[0]),
//             Container(
//               child:
//               TableCalendar(
//                 locale: "en_US",
//                 calendarFormat : CalendarFormat.week,
//                 rowHeight: 43,
//                 calendarStyle: CalendarStyle(
//                   selectedDecoration: BoxDecoration(color: GlobalColors.primaryColor,shape: BoxShape.circle),
//                   todayDecoration : BoxDecoration(color: Color(0xFFFFB892), shape: BoxShape.circle),
//                 ),
//                 headerStyle: HeaderStyle(
//                   formatButtonVisible: false,
//                   titleCentered: true,
//                   titleTextStyle : const TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold ),
//                 ),
//                 availableGestures: AvailableGestures.all,
//                 selectedDayPredicate: (day) => isSameDay(day, today),
//                 focusedDay: today,
//                 firstDay: DateTime.utc(2010,10,16),
//                 lastDay: DateTime.utc(2030,3,14),
//                 onDaySelected: _onDaySelected,
//               ),
//             )
//           ],
//         ),
//       ),
//
//     );
//   }
//  }
