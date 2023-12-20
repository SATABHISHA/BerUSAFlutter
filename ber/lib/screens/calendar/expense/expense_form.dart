

import 'package:ber/screens/calendar/calendar_day_selection.dart';
import 'package:ber/screens/calendar/expense/expense_type_entry.dart';
import 'package:ber/widgets/reusable_common_widgets/reusable_constants.dart';
import 'package:ber/widgets/reusable_common_widgets/reusable_dropdown_formfield.dart';
import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  // const ExpenseForm({Key? key}) : super(key: key);
  static String id = 'ExpenseForm';

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  GlobalKey<FormFieldState> _locationFromDropDown = new GlobalKey<FormFieldState>();


  void updateSelectedDate(int daysToAdd) {
    setState(() {
      int currentIndex = CalendarDaySelection.CalendarDaySelectionWeekDaysJsonList
          .indexWhere(
              (weekdate) => weekdate['weekDayDate'] == CalendarDaySelection.CalendarDaySelectionSelectedDate);

      if (currentIndex != -1) {
        // int newIndex = (currentIndex + daysToAdd) % CalendarDaySelection.CalendarDaySelectionWeekDaysJsonList.length;
        int newIndex = currentIndex + daysToAdd;
        /*if (newIndex < 0) {
          newIndex += CalendarDaySelection.CalendarDaySelectionWeekDaysJsonList.length;
        }*/
        if (newIndex >= 0 && newIndex < CalendarDaySelection.CalendarDaySelectionWeekDaysJsonList.length) {
          CalendarDaySelection.CalendarDaySelectionSelectedDate =
          CalendarDaySelection.CalendarDaySelectionWeekDaysJsonList[newIndex]['weekDayDate'];
          // Add your logic to handle the selected date update
          print("Selected Date: ${CalendarDaySelection.CalendarDaySelectionSelectedDate}");
        }
        /*CalendarDaySelection.CalendarDaySelectionSelectedDate =
        CalendarDaySelection.CalendarDaySelectionWeekDaysJsonList[newIndex]['weekDayDate'];
        // Add your logic to handle the selected date update
        print("Selected Date: ${CalendarDaySelection.CalendarDaySelectionSelectedDate}");*/
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(117, 185, 223, 1.0),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: [
            Builder(
                builder: (context) {
                  return Container(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(

                              child: Image.asset('images/arrowleft.png',width: 40, height: 40,),
                              onTap: (){Navigator.pushNamed(context, CalendarDaySelection.id);},
                            ),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Enter Trip Info', style: TextStyle(fontSize: 18, color: Colors.white),),
                              // Text('(12-02-2023 - 12-08-2023)', style: TextStyle(fontSize: 13, color: Colors.white),),
                              Text('${CalendarDaySelection.CalendarDaySelectionSelectedDate}', style: TextStyle(fontSize: 13, color: Colors.white),),
                            ],
                                                  ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: (){
                                    updateSelectedDate(-1);
                                  },
                                  child: Image.asset('images/arrowleft.png',width: 40, height: 40, )
                              ),
                              InkWell(
                                  child: Image.asset('images/arrowright.png',width: 40, height: 40, ),
                                  onTap: (){
                                    /*if(CalendarDaySelection.CalendarDaySelectionWeekDaysJsonList.any((weekdate) => weekdate['weekDayDate'] == CalendarDaySelection.CalendarDaySelectionSelectedDate) == true){
                                      print('Eureka-=> ${CalendarDaySelection.CalendarDaySelectionSelectedDate}');


                                    }*/
                                    updateSelectedDate(1);
                                  },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select Loction From', style: TextStyle(color: Color.fromRGBO(
                              31, 31, 31, 1.0),fontSize: 16, fontWeight: FontWeight.w400)),
                          Container(
                            height: 30,
                            // color: Colors.white,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)),),
                            // width: 41,
                            child: ReusableDropDownFormField(
                              key: UniqueKey(),
                              hintName: 'Select Item',
                              dropDownCustomDecoration: dropDownCustomDecoration,
                              onChanged: (value){},
                              onSaved: (value){},
                              /*list: locationList
                                  .where((e) => e != null) //removes null items
                                  .toSet()
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                                  .toList(),*/
                              list: [],
                            ),
                          ),
                          SizedBox(height: 15,),

                          Text('Select Loction To', style: TextStyle(color: Color.fromRGBO(31, 31, 31, 1.0),fontSize: 16, fontWeight: FontWeight.w400)),
                          Container(
                            height: 30,
                            // color: Colors.white,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)),),
                            // width: 41,
                            child: ReusableDropDownFormField(
                              key: UniqueKey(),
                              hintName: 'Select Item',
                              dropDownCustomDecoration: dropDownCustomDecoration,
                              onChanged: (value){},
                              onSaved: (value){},
                              /*list: locationList
                                  .where((e) => e != null) //removes null items
                                  .toSet()
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                                  .toList(),*/
                              list: [],
                            ),
                          ),
                          SizedBox(height: 15,),

                          Text('Purpose', style: TextStyle(color: Color.fromRGBO(31, 31, 31, 1.0),fontSize: 16, fontWeight: FontWeight.w400)),
                          Container(
                            height: 30,
                            // color: Colors.white,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)),),
                            // width: 41,
                            child: ReusableDropDownFormField(
                              key: UniqueKey(),
                              hintName: 'Select Item',
                              dropDownCustomDecoration: dropDownCustomDecoration,
                              onChanged: (value){},
                              onSaved: (value){},
                              /*list: locationList
                                  .where((e) => e != null) //removes null items
                                  .toSet()
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                                  .toList(),*/
                              list: [],
                            ),
                          ),
                          SizedBox(height: 15,),

                          Text('Select Task', style: TextStyle(color: Color.fromRGBO(31, 31, 31, 1.0),fontSize: 16, fontWeight: FontWeight.w400)),
                          Container(
                            height: 30,
                            // color: Colors.white,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)),),
                            // width: 41,
                            child: ReusableDropDownFormField(
                              key: UniqueKey(),
                              hintName: 'Select Item',
                              dropDownCustomDecoration: dropDownCustomDecoration,
                              onChanged: (value){},
                              onSaved: (value){},
                              /*list: locationList
                                  .where((e) => e != null) //removes null items
                                  .toSet()
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                                  .toList(),*/
                              list: [],
                            ),
                          ),

                          SizedBox(height: 15,),

                          Text('Note', style: TextStyle(color: Color.fromRGBO(31, 31, 31, 1.0),fontSize: 16, fontWeight: FontWeight.w400)),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: TextField(
                              maxLines: null,
                              // Setting maxLines to null allows for unlimited lines
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(16.0),
                                hintText: 'Enter your text here...',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(fontSize: 16.0),
                              scrollPadding: EdgeInsets.all(16.0),
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                //---submit/approve/return btn, code starts
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black54), right: BorderSide(width: 1, color: Colors.black54))),
                          child: MaterialButton( onPressed: (){Navigator.pushNamed(context, ExpenseTypeEntry.id);},child: Text('Enter/Update\nExpense', style: TextStyle(fontSize: 15, color: Color.fromRGBO(38, 38, 38, 1.0)), textAlign: TextAlign.center,)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black54))),
                          child: MaterialButton( onPressed: (){},child: Text('View Expense\nSummary', style: TextStyle(fontSize: 15, color: Color.fromRGBO(
                              38, 38, 38, 1.0),),textAlign: TextAlign.center,)),
                        ),
                      )
                    ],
                  ),
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
