

import 'dart:convert';

import 'package:ber/services/calendar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class CalendarDataProvider with ChangeNotifier {
  CalendarModel calendarModel = CalendarModel();
  // Add your API endpoint URL
  final String apiUrl = 'https://your-api-endpoint.com/data';

  Map<DateTime, List<dynamic>> events = {};

  Future<void> fetchData() async {
    // Fetch data from your API based on the start and end dates
    // Update the 'events' map with the fetched data
    // Notify listeners to update the UI
    // This is a simplified example; you should handle errors and parsing appropriately

    // Example API request
   /* final response = await http.get('$apiUrl?start=$start&end=$end');
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Assume data is a List of events, each having a 'date' property
      for (var event in data) {
        DateTime date = DateTime.parse(event['date']);
        events[date] = events[date] ?? [];
        events[date]?.add(event);
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }*/

    var data = {
      "CorpID" : 'hit',
      "UserID" : '7',
      "Year" : '2023',
    };
    var calendarDetails = await calendarModel.getWeekDateListYearwiseOnPost(data: data);
    print('responsaData-=>${calendarDetails}');
  }
}


class CalendarHome extends StatelessWidget {
  // const CalendarHome({Key? key}) : super(key: key);
  static String id = 'CalendarHome';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Calendar App'),

        ),
        body: Center(
          child: Column(
            children: [
              Consumer<CalendarDataProvider>(
                builder: (context, calendarData, child) {
                  return TableCalendar(
                    locale: "en_US",
                    rowHeight: 43,
                    headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
                    firstDay: DateTime.utc(2023, 1, 1), // Replace with your desired start date
                    lastDay: DateTime.utc(2023, 12, 31), // Replace with your desired end date
                    focusedDay: DateTime.now(), // This is the missing focusedDay parameter,
                    // Configure your calendar options here
                    onDaySelected: (selectedDay, focusedDay) {
                      // Fetch data for the selected month
                      DateTime start = DateTime(selectedDay.year, selectedDay.month - 2);
                      DateTime end = DateTime(selectedDay.year, selectedDay.month + 3);
                      // calendarData.fetchData(start, end);
                      calendarData.fetchData();
                    },



                    // Add events to the calendar
                    // events: calendarData.events,
                  );
                },
              ),
              // Add a widget to display the events for the selected date
            ],
          ),
        ),
      ),
    );
  }
}
