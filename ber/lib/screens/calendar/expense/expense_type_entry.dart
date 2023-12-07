

import 'package:ber/reusable_widgets_constants/reusable_constants.dart';
import 'package:ber/screens/calendar/expense/expense_form.dart';
import 'package:flutter/material.dart';

class ExpenseTypeEntry extends StatefulWidget {
  // const ExpenseTypeEntry({Key? key}) : super(key: key);
  static String id = 'ExpenseTypeEntry';

  @override
  State<ExpenseTypeEntry> createState() => _ExpenseTypeEntryState();
}

class _ExpenseTypeEntryState extends State<ExpenseTypeEntry> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          return false;
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
                                onTap: (){Navigator.pushNamed(context, ExpenseForm.id);},
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Enter Expense Amount', style: TextStyle(fontSize: 18, color: Colors.white),),
                                ],
                              ),
                            ],
                          ),

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
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(117, 185, 223, 1.0),
                      // color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(text: 'Expense type:', style: TextStyle(fontSize:15, color: Colors.white, decoration: TextDecoration.none),),
                              TextSpan(text: ' Travel', style: TextStyle(fontSize: 15, color: Color.fromRGBO(
                                  138, 109, 76, 1.0), decoration: TextDecoration.none)),
                            ]
                            )),
                            Image.asset('images/downarrow.png', width: 40, height: 40,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          //--header title, code starts
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Rate/\nMile', style: TextStyle(fontSize: 14, color: Color.fromRGBO(
                                  26, 26, 26, 1.0)),),
                              SizedBox(width: 10,),
                              Text('Miles/\nTravelled', style: TextStyle(fontSize: 14, color: Color.fromRGBO(
                                  26, 26, 26, 1.0)),),
                              SizedBox(width: 10,),
                              Text('Expense\nAmt', style: TextStyle(fontSize: 14, color: Color.fromRGBO(
                                  26, 26, 26, 1.0)),),
                              SizedBox(width: 10,),
                            ],
                          ),
                          //--header title, code ends

                          //---Personal Auto, code starts
                          SizedBox(height: 5,),
                          // TextField(decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0',),)
                          Container(
                            width: 40,
                            child: TextField(
                              // Setting maxLines to null allows for unlimited lines
                              decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                            ),
                          ),
                          //---Personal Auto, code ends
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
