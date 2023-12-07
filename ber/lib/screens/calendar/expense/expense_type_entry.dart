

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
  bool isContainerOpen = false;
  bool isPerdiemContainerOpen = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPerdiem = GlobalKey<FormState>();
  final TextEditingController _personalAutoRateMileController = TextEditingController();
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: [
                      //---Expense Type: Travel, code starts
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
                              InkWell(
                                  onTap : (){
                                    setState(() {
                                      isContainerOpen = !isContainerOpen;
                                    });

                                    },
                                  child: Image.asset('images/downarrow.png', width: 40, height: 40,)),
                            ],
                          ),
                        ),
                      ),

                      Visibility(
                          visible: isContainerOpen,
                          child: Form(
                            key: _formKey,
                            child: AnimatedContainer(
                              duration: Duration(seconds: 5),
                              curve: Curves.easeInOut,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                  border: Border(right: BorderSide(width: 1, color: Color.fromRGBO(68, 68, 68, 1.0)), left: BorderSide(width: 1, color: Color.fromRGBO(68, 68, 68, 1.0)), bottom: BorderSide(width: 1, color: Color.fromRGBO(68, 68, 68, 1.0))),
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //--header title/ cost details, code starts
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 22,),
                                            Container(
                                              // height: 25,
                                              // color: Colors.blue,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                  child: Text('Personal Auto', style: TextStyle(fontSize: 15, color: Colors.black),),
                                                )),
                                            SizedBox(height: 10,),
                                            Container(
                                              // height: 25,
                                              // color: Colors.blue,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                  child: Text('Rental Car', style: TextStyle(fontSize: 15, color: Colors.black),),
                                                )),
                                            SizedBox(height: 10,),
                                            Container(
                                              // height: 25,
                                              // color: Colors.blue,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                  child: Text('Bus Fare', style: TextStyle(fontSize: 15, color: Colors.black),),
                                                )),
                                            SizedBox(height: 10,),
                                            Container(
                                              // height: 25,
                                              // color: Colors.blue,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                  child: Text('Air Fare', style: TextStyle(fontSize: 15, color: Colors.black),),
                                                )),
                                            SizedBox(height: 10,),
                                            Container(
                                              // height: 25,
                                              // color: Colors.blue,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                  child: Text('Train Fare', style: TextStyle(fontSize: 15, color: Colors.black),),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              Text('Rate/\nMile', style: TextStyle(fontSize: 14, color: Color.fromRGBO(
                                                  26, 26, 26, 1.0)),),
                                              //---rate/mile(for Personal Auto) textfield, code starts
                                              Container(
                                                width: 40,
                                                height: 40,
                                                child: TextField(
                                                  controller: _personalAutoRateMileController,
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---rate/mile(for Personal Auto) textfield, code ends
                                              SizedBox(height: 160,),


                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            children: [
                                              Text('Miles/\nTravelled', style: TextStyle(fontSize: 14, color: Color.fromRGBO(
                                                  26, 26, 26, 1.0)),),
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              SizedBox(height: 160,),
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            children: [
                                              Text('Expense\nAmt', style: TextStyle(fontSize: 14, color: Color.fromRGBO(
                                                  26, 26, 26, 1.0)),),
                                              //---Personal Auto, textfield code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---Personal Auto, textfield code ends

                                              //---Rental car, textfield code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---Rental car, textfield code ends

                                              // ---Bus Fare, textfield code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---Bus Fare, textfield code ends

                                              // ---Air Fare, textfield code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---Air Fare, textfield code ends

                                              // ---Train Fare, textfield code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---Train Fare, textfield code ends


                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                        ],
                                      ),
                                    ],
                                  ),
                                  //--header title/ cost details, code ends
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Total', style: TextStyle(fontSize: 18, color: Colors.black),),
                                      SizedBox(width: 10,),
                                      // ---Total Fare, textfield code starts
                                      Container(
                                        width: 100,
                                        height: 40,
                                        child: TextField(
                                            textAlign: TextAlign.start,
                                            // Setting maxLines to null allows for unlimited lines
                                            decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                        ),
                                      ),
                                      //---Total Fare, textfield code ends
                                      SizedBox(width: 10,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                      ),
                      //---Expense Type: Travel, code ends

                      //---Expense Type: Perdiem, code starts
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
                                    TextSpan(text: ' Perdiem Related', style: TextStyle(fontSize: 15, color: Color.fromRGBO(
                                        138, 109, 76, 1.0), decoration: TextDecoration.none)),
                                  ]
                              )),
                              InkWell(
                                  onTap : (){
                                    setState(() {
                                      isPerdiemContainerOpen = !isPerdiemContainerOpen;
                                    });

                                  },
                                  child: Image.asset('images/downarrow.png', width: 40, height: 40,)),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                          visible: isPerdiemContainerOpen,
                          child: Form(
                            key: _formKeyPerdiem,
                            child: AnimatedContainer(
                              duration: Duration(seconds: 5),
                              curve: Curves.easeInOut,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                  border: Border(right: BorderSide(width: 1, color: Color.fromRGBO(68, 68, 68, 1.0)), left: BorderSide(width: 1, color: Color.fromRGBO(68, 68, 68, 1.0)), bottom: BorderSide(width: 1, color: Color.fromRGBO(68, 68, 68, 1.0))),
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //--header title/ cost details, code starts
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 22,),
                                            Container(
                                              // height: 25,
                                              // color: Colors.blue,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                  child: Text('Meal', style: TextStyle(fontSize: 15, color: Colors.black),),
                                                )),
                                            SizedBox(height: 10,),
                                            Container(
                                              // height: 25,
                                              // color: Colors.blue,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                  child: Text('Logging', style: TextStyle(fontSize: 15, color: Colors.black),),
                                                )),
                                            SizedBox(height: 10,),

                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          SizedBox(width: 10,),
                                          Column(
                                            children: [
                                              // SizedBox(height: 10,),
                                              Text('\nAllowance', style: TextStyle(fontSize: 14, color: Color.fromRGBO(
                                                  26, 26, 26, 1.0)),),
                                              //---meal, code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---meal, code ends
                                              //---Logging, code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---Logging, code ends
                                              // SizedBox(height: 120,),
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            children: [
                                              Text('Expense\nAmt', style: TextStyle(fontSize: 14, color: Color.fromRGBO(
                                                  26, 26, 26, 1.0)),),
                                              //---Meal Expense, textfield code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---Meal Expense, textfield code ends

                                              //---Logging, textfield code starts
                                              Container(
                                                width: 50,
                                                height: 40,
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    // Setting maxLines to null allows for unlimited lines
                                                    decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                                ),
                                              ),
                                              //---Logging car, textfield code ends
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                        ],
                                      ),
                                    ],
                                  ),
                                  //--header title/ cost details, code ends
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Total', style: TextStyle(fontSize: 18, color: Colors.black),),
                                      SizedBox(width: 10,),
                                      // ---Total Fare, textfield code starts
                                      Container(
                                        width: 50,
                                        height: 40,
                                        child: TextField(
                                            textAlign: TextAlign.start,
                                            // Setting maxLines to null allows for unlimited lines
                                            decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                        ),
                                      ),
                                      //---Total Fare, textfield code ends
                                      SizedBox(width: 10,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                      ),
                      //---Expense Type: Perdiem, code ends

                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
