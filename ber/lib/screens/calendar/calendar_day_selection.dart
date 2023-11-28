import 'package:flutter/material.dart';

class CalendarDaySelection extends StatefulWidget {
  // const CalendarDaySelection({Key? key}) : super(key: key);
  static String id = 'CalendarDaySelection';

  @override
  State<CalendarDaySelection> createState() => _CalendarDaySelectionState();
}

class _CalendarDaySelectionState extends State<CalendarDaySelection> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),
        // appBar: AppBar(backgroundColor: Colors.amber,),

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
            child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
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
                      ),
                      SizedBox(height: 20,),
                      Text('Week Date: 01/20/2023', style: TextStyle(fontSize: 20, color: Color.fromRGBO(17, 17, 17, 1.0), fontWeight: FontWeight.w600),),
                      Text('(01/14/2023 - 01/20/2023)', style: TextStyle(fontSize: 16, color: Color.fromRGBO(17, 17, 17, 1.0), fontWeight: FontWeight.normal),),

                    ],
                  ),

                ]
            ),
          ),
        ),
      ),
    );
  }
}
