import 'package:ber/screens/calendar/calendar_day_selection_list_tile.dart';
import 'package:ber/screens/calendar/calendar_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CalendarDaySelection extends StatefulWidget {
  // const CalendarDaySelection({Key? key}) : super(key: key);
  static String id = 'CalendarDaySelection';

  @override
  State<CalendarDaySelection> createState() => _CalendarDaySelectionState();
}

class _CalendarDaySelectionState extends State<CalendarDaySelection> {
  List<Map<String, dynamic>> weekDaysJsonList = [];

  List<Map<String, dynamic>> getDateRangeWithWeekdays(String startDateString, String endDateString)
  {

    if(weekDaysJsonList.isNotEmpty){
      weekDaysJsonList.clear();
    }

    DateTime startDate = DateFormat('MM-dd-yyyy').parse(startDateString);
    DateTime endDate = DateFormat('MM-dd-yyyy').parse(endDateString);

    List<String> dateRangeWithWeekdays = [];

    while (startDate.isBefore(endDate) || startDate.isAtSameMomentAs(endDate)) {
      String formattedDate = DateFormat('MM-dd-yyyy EEEE').format(startDate);
      String formattedWeekDate = DateFormat('MM-dd-yyyy').format(startDate);
      String formattedWeekDayName = DateFormat('EEEE').format(startDate);
      Map<String, dynamic> combinedWeekDaysList = {
        "weekDayDate" : formattedWeekDate,
        "weekDayName" : formattedWeekDayName
      };
      weekDaysJsonList.add(combinedWeekDaysList);
      dateRangeWithWeekdays.add(formattedDate);
      startDate = startDate.add(Duration(days: 1));
    }

    return weekDaysJsonList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('StartDateTest-=>${CalendarHome.calendar_home_day_selection_list['StartDate']}');
    // List<String> dateRange = getDateRange(CalendarHome.calendar_home_day_selection_list['StartDate'].toString(), CalendarHome.calendar_home_day_selection_list['EndDate'].toString());
    // List<DateTime> dateRange = getDateRange('11-26-2023', '11-30-2023');
    List<Map<String, dynamic>> dateRangeWithWeekdays = getDateRangeWithWeekdays(CalendarHome.calendar_home_day_selection_list['StartDate'], CalendarHome.calendar_home_day_selection_list['EndDate']);
    // List<String> dateRangeWithWeekdays = getDateRangeWithWeekdays('2023-11-26', '2023-11-30');


        setState(() {

          for (var formattedDate in dateRangeWithWeekdays) {
            print(formattedDate); // Print each date with weekday name in the range
          }

          /*for (DateTime formattedDate in dateRange) {
            print(formattedDate); // Print each date with weekday name in the range
          }*/
        });
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> customWeekDayList = [];
    for(var weekdaysJsonList in weekDaysJsonList){
      try{
        customWeekDayList.add(new CalendarDaySelectionListTile(weekDay: weekdaysJsonList['weekDayDate'], weekDayName: weekdaysJsonList['weekDayName'], onPressedEditBtn: (){}));
      }catch(e){

      }
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(117, 185, 223, 1.0),
          automaticallyImplyLeading: true, //---for back button
          title: Text('Select Day', style: TextStyle(color: Colors.white),),
        ),
        /*appBar: AppBar(
          // backgroundColor: Color.fromRGBO(71, 71, 71, 1.0),
          backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Builder(
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text('Hello ${EmployeeLogin.employeeJsonData['employee']['employee_full_name']} (${EmployeeLogin.employeeJsonData['user']['user_name']})', style: TextStyle(fontSize: 14, color: Colors.white),),
                        // MediaQuery.of(context).size.width > 950 ? Text('Hello nnnd nfnnfnnf fnnfnfnfnf', style: TextStyle(fontSize: 14, color: Colors.white),) : SizedBox(),

                        SizedBox(width: 10,),

                      ],
                    ),
                  );
                }
            ),
          ],

        ),*/
        body: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          // color: Colors.lightGreenAccent,
          decoration: BoxDecoration(
            /*gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  // Color.fromRGBO(2, 72, 254, 1.0),
                  Colors.blue,
                  Colors.yellow,
                  Colors.redAccent,

                ],
              )*/
              color: Color.fromRGBO(255, 255, 255, 1.0)
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Column(
                      children: [
                        /*Container(
                          width: double.infinity,
                          // height: 60,
                          color: Color.fromRGBO(117, 185, 223, 1.0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Column(
                              children: [
                                Center(
                                  child: Text('Select Day', style: TextStyle(color: Color.fromRGBO(
                                      255, 255, 255, 1.0), fontSize: 18),),
                                ),

                              ],
                            ),
                          ),
                        ),*/ //---commented on 1st-Dec-2023
                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Align(alignment: Alignment.centerLeft,child: Text('Week Date: ${CalendarHome.calendar_home_day_selection_list['WeekDate']}', style: TextStyle(fontSize: 20, color: Color.fromRGBO(17, 17, 17, 1.0), fontWeight: FontWeight.w600),)),
                        ),
                        // Text('(01/14/2023 - 01/20/2023)', style: TextStyle(fontSize: 16, color: Color.fromRGBO(17, 17, 17, 1.0), fontWeight: FontWeight.normal),),
                        SizedBox(height: 20,),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            // height: MediaQuery.of(context).size.height,
                            // height: 200,
                            decoration: BoxDecoration(color: Color.fromRGBO(
                                215, 215, 215, 1.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 8, 15, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${CalendarHome.calendar_home_day_selection_list['StartDate']} - ${CalendarHome.calendar_home_day_selection_list['EndDate']}', style: TextStyle(fontSize: 16, color: Color.fromRGBO(17, 17, 17, 1.0), fontWeight: FontWeight.normal)),
                                  SizedBox(height: 20,),
                                  Container(
                                    color: Color.fromRGBO(117, 185, 223, 1.0),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 10, 5, 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Text('Week Date', style: TextStyle(fontSize: 15, color: Colors.white),),
                                          Text('${CalendarHome.calendar_home_day_selection_list['WeekDate']}', style: TextStyle(fontSize: 18, color: Colors.white),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      /* children: [
                                    new CalendarDaySelectionListTile(weekDay: '11-26-2023', weekDayName: 'Monday', onPressedEditBtn: () {}),
                                  ],*/
                                      children: customWeekDayList,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        //---saved/approved/submitted/return indicators, code starts
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(width: 10, height: 10, color: Color.fromRGBO(246, 236, 193, 1.0),),
                                      SizedBox(width: 5,),
                                      Text('Saved', style: TextStyle(fontSize: 13),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(width: 10, height: 10, color: Color.fromRGBO(
                                          194, 218, 231, 1.0),),
                                      SizedBox(width: 5,),
                                      Text('Approved', style: TextStyle(fontSize: 13),),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(width: 45,),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(width: 10, height: 10, color: Color.fromRGBO(
                                          242, 210, 255, 1.0),),
                                      SizedBox(width: 5,),
                                      Text('Submitted', style: TextStyle(fontSize: 13),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(width: 10, height: 10, color: Color.fromRGBO(
                                          220, 173, 131, 1.0),),
                                      SizedBox(width: 5,),
                                      Text('Returned', style: TextStyle(fontSize: 13),),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        //---saved/approved/submitted/return indicators, code ends

                      ],
                    ),
                  ),
                ),


                //---submit/approve/return btn, code starts
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black54), right: BorderSide(width: 1, color: Colors.black54))),
                        child: MaterialButton( onPressed: (){},child: Text('Submit', style: TextStyle(fontSize: 15, color: Colors.black54),)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black54), right: BorderSide(width: 1, color: Colors.black54))),
                        child: MaterialButton( onPressed: (){},child: Text('Approve', style: TextStyle(fontSize: 15, color: Colors.black54),)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black54))),
                        child: MaterialButton( onPressed: (){},child: Text('Return', style: TextStyle(fontSize: 15, color: Colors.black54),)),
                      ),
                    )
                  ],
                ),
                //---submit/approve/return btn, code ends
              ],
            ),
          ),
        ),
      ),
    );
  }
}
