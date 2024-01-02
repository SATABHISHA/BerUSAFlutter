

import 'dart:convert';

import 'package:ber/screens/calendar/calendar_day_selection.dart';
import 'package:ber/services/calendar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:xml/xml.dart' as xml;
import 'package:intl/intl.dart';


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
      "Year" : '2024',
    };
    var calendarDetails = await calendarModel.getWeekDateListYearwiseOnPost(data: data);
    print('responsaData-=>${calendarDetails}');
  }
}

class CalendarHome extends StatefulWidget {
  // const CalendarHome({Key? key}) : super(key: key);
  static String id = 'CalendarHome';
  static Map<String, dynamic> calendar_home_day_selection_list = {};

  @override
  State<CalendarHome> createState() => _CalendarHomeState();
}

class _CalendarHomeState extends State<CalendarHome> {
  CalendarModel calendarModel = CalendarModel();
  Map<DateTime, List<dynamic>> events = {};
  List<dynamic> weekDaysList = [];
  List<Map<String, dynamic>> weekDaysJsonList = []; //---added on 27th Nov 2023
  // List<dynamic> eventsDay = [];
  // CalendarController _calendarController;


  Future<void> fetchData() async {

    if(weekDaysList.isEmpty){
      weekDaysList.clear();
    }
    if(weekDaysJsonList.isNotEmpty){
      weekDaysJsonList.clear();
    }
    var data = {
      "CorpID" : 'hit',
      "UserID" : '7',
      "Year" : '2024',
    };
    var calendarDetails = await calendarModel.getWeekDateListYearwiseOnPost(data: data);
    // print('responsaData-=>${calendarDetails}');

    // Parse the XML string
    var document = xml.XmlDocument.parse(calendarDetails);

    // Extract the JSON string from the XML
    var jsonString = document.findAllElements('string').first.text;

    // Parse the JSON string
    var jsonData = jsonDecode(jsonString);

    // Convert the JSON data back to a formatted JSON string
    var formattedJsonString = JsonEncoder.withIndent('  ').convert(jsonData);

    print("JsonData-=>$formattedJsonString");

    final Map<String, dynamic> jsonMap = json.decode(formattedJsonString.toString());
    // print('Message-=>${jsonResponse['Msg'].toString()}');
    //---code taken from ChatGpt, code starts
    List<dynamic> months = jsonMap['Months'];
    // weekDaysList.add('2023-10-24 00:00:00.000Z');
    // Populate events map
    for (var month in months) {
      String monthValue = month['Month'];
      List<dynamic> weekDates = month['WeekDates'];


      for (var weekDate in weekDates) {
        String weekDateValue = weekDate['WeekDate'];
        // List<dynamic> weekDays = weekDate['Day'];
        setState(() {
          // Convert the original date string to DateTime
          // DateTime dateTime = DateTime.parse(weekDate['WeekDate']);

          DateTime date = DateFormat("dd-MM-yyyy").parse(weekDate['WeekDate']);
          // Format the DateTime as a string in the desired format
          // String formattedDate = date.toUtc().toIso8601String();
          // String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(date.toUtc());
          String formattedDate = DateFormat('yyyy-MM-dd').format(date.toUtc());
          // weekDaysList.add(weekDate['WeekDate']);
          weekDaysList.add(formattedDate+' 00:00:00.000Z');

          //---added on 27th Nov, 2023, code starts
          for (var weekDate in weekDates) {
            Map<String, dynamic> combinedJsonWeekDayItems = {
              "Day": weekDate["Day"],
              "WeekDate": weekDate["WeekDate"],
              "StartDate": weekDate["StartDate"],
              "EndDate": weekDate["EndDate"],
              "BERStatus": weekDate["BERStatus"]
            };
            weekDaysJsonList.add(combinedJsonWeekDayItems);
          }
          //---added on 27th Nov, 2023, code ends

        });

        // weekDaysList = weekDate['WeekDate'];
        // String weekDays = weekDate['Day'];
        // DateTime date = DateTime.parse('$monthValue-$weekDays-2023');
        // DateTime date = DateFormat("MM-dd-yyyy").parse('$monthValue-$weekDays-2023');
        // print('Date-=>$date');
        // events[date] = ['Yellow']; // Add yellow color to events
        /*for (var day in weekDays) {
          DateTime date = DateTime.parse('$monthValue-$day-2023');
          events[date] = ['Yellow Color']; // Add yellow color to events
          // eventsDay = ['Yellow Color']; // Add yellow color to events
        }*/

      }
      print('WeekdaysPrevTest-=>$weekDaysList');
    }
    //---code taken from ChatGpt, code ends
  }


  //---added on 27th Nov 2023, code starts
  String convertDateString(String inputDateString) {
    // Parse the input date string
    DateTime dateTime = DateTime.parse(inputDateString);

    // Format the date as "MM-dd-yyyy"
    String formattedDateString = "${dateTime.month.toString().padLeft(2, '0')}-"
        "${dateTime.day.toString().padLeft(2, '0')}-"
        "${dateTime.year.toString()}";

    return formattedDateString;
  }
  //---added on 27th Nov 2023, code ends

  @override
  void initState(){
    super.initState();
    setState(() {
      fetchData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Calendar App'),
        ),
        body: Center(
          child: Column(
            children: [
              TableCalendar(
            locale: "en_US",
            rowHeight: 43,

            headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
            firstDay: DateTime.utc(2024, 1, 1), // Replace with your desired start date
            lastDay: DateTime.utc(2024, 12, 31), // Replace with your desired end date
            focusedDay: DateTime.now(), // This is the missing focusedDay parameter,
            // Configure your calendar options here
            onDaySelected: (selectedDay, focusedDay) {
              // Fetch data for the selected month
              DateTime start = DateTime(selectedDay.year, selectedDay.month - 2);
              DateTime end = DateTime(selectedDay.year, selectedDay.month + 3);
              // calendarData.fetchData(start, end);
              // calendarData.fetchData();
              // print('Selected date: $date');
              print('Selected Day test: $selectedDay');

              //---code added on 27-Nov-2023, starts
              String formattedDateString = convertDateString(selectedDay.toString());
              if(weekDaysJsonList.any((weekDate) => weekDate["WeekDate"] == formattedDateString) == true){
                // List<Map<String, dynamic>> filteredList = weekDaysJsonList.any((weekDate) => (weekDate["WeekDate"]) == formattedDateString).toList();
                List<Map<String, dynamic>> filteredData = weekDaysJsonList.where((weekDate) => (weekDate["WeekDate"]) == formattedDateString).toList();

                CalendarHome.calendar_home_day_selection_list = (filteredData.isNotEmpty? filteredData[0]: null)!;
                // print('testDaySelection-=>$filteredData');
                print('testDaySelection-=>${CalendarHome.calendar_home_day_selection_list}');
                Navigator.pushNamed(context, CalendarDaySelection.id);
              }
              //---code added on 27-Nov-2023, ends
            },


                /*selectedDayPredicate: (day) {
                  // events['date'] ?? [];
                  print("test-=>${day}");

                  *//*setState(() {

                  });*//*
                  print('weekdays test-=>$weekDaysList');
                 *//* for(var weekdays in weekDaysList){
                    print('weekdays test-=>$weekdays');
                  }*//*
                  if(day.weekday == DateTime.sunday) {
                    return true;
                  }else{
                    return false;
                  }
                },*/

            // Add events to the calendar
            // eventLoader: (day) => events,
                eventLoader: (day) {
                  print("eventLoader-=> ${weekDaysList}");
                  // return events['date'] ?? [];
                  return weekDaysList;
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    print("test calendarBuildr-=>$date");
                    // Customize markers on each date if needed
                    var color, textColor;
                    String formattedDateString = convertDateString(date.toString());

                    print('test dates-=>$formattedDateString');

                    //---added on 27th Nov 2023, code starts
                    if(weekDaysJsonList.any((weekDate) => weekDate["WeekDate"] == formattedDateString) == true){
                      color = Colors.orange;
                      textColor = Colors.white;

                      print('Success Eureka');
                    }else{
                      print('Failed-=>$formattedDateString');
                      color = Colors.transparent;
                      textColor = Colors.black54;
                    }




                    //---added on 27th Nov 2023, code ends
                    // return Positioned(child: _buildEventsMarker(events));

                    final EventColor = weekDaysList.contains(date.toString()) == true ? Colors.orange : Colors.transparent;
                    /*if(weekDaysList.contains(date.toString()) == true){
                      color = Colors.orange;
                      textColor = Colors.white;
                    }else{
                      color = Colors.transparent;
                      textColor = Colors.black54;
                    }*/ //---commented on 27th Nov 2023
                    /*if(weekDaysList.contains(date)){
                      color = Colors.orange;
                      print("Eureka");
                    }else{
                      color = Colors.greenAccent;
                      print("Failed Calendar");
                    }*/
                    /*for(var weekdays in weekDaysList){
                      if(weekdays == date.toString()){
                        color = Colors.orange;
                        print("Eureka");
                        print('TestSuccess-=>$weekdays');
                        // break;
                      }else{
                        color = Colors.greenAccent;
                        print("Failed Calendar");
                        print('Testfailed-=>$weekdays and original date: $date' );
                      }
                    }*/
                    return
                      Container(
                      /*width: 5,
                      height: 5,*/
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),

                        child: Text(
                          '${date.day}',
                          style: TextStyle(color: textColor),
                        ),
                    );
                  },
                ),



          ),

          // Add a widget to display the events for the selected date
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildEventsMarker(List<dynamic> events) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color: Colors.yellow,
      ),
      width: 20,
      height: 20,
      /*child: Center(
        child: Text(
          events.length.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),*/
    );

  }
}

Widget _buildEventsMarker(List<dynamic> events) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.yellow,
    ),
    width: 20,
    height: 20,
    child: Center(
      child: Text(
        events.length.toString(),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
