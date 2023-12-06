

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
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
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
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
