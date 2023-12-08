import 'package:ber/reusable_widgets_constants/reusable_constants.dart';
import 'package:ber/screens/calendar/expense/expense_type_entry.dart';
import 'package:flutter/material.dart';

class ExpenseSummary extends StatefulWidget {
  // const ExpenseSummary({Key? key}) : super(key: key);
  static String id = 'ExpenseSummary';

  @override
  State<ExpenseSummary> createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async{return false;},
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
                                onTap: (){Navigator.pushNamed(context, ExpenseTypeEntry.id);},
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Expense Summary', style: TextStyle(fontSize: 18, color: Colors.white),),
                                  Text('12/08/2023(Friday)', style: TextStyle(fontSize: 13, color: Colors.white),),
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
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          children: [

                            //---Personal Auto, code starts
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(201, 200, 200, 1.0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text('Travel', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Personal Auto', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0)),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),
                            //---Personal Auto, code starts

                            //---Perdiem Related/Limited, code starts
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(201, 200, 200, 1.0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text('Perdiem Related / Limited', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            //---Meal
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Meal', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0)),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),

                            //---Lodging
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Lodging', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0)),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),
                            //---Perdiem Related/Limited, code ends

                            //---Other Expense, code starts
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(201, 200, 200, 1.0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text('Other Expenses', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            //---Tolls/Parking
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Tolls/Parking', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0)),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),

                            //---Taxi/Transit
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Taxi/Transit', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0)),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),

                            //---Copy Service
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Copy Service', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0)),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),
                            //---Other Expense, code ends

                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Colors.black,
                            ),

                            SizedBox(height: 10,),
                            //---Total Expense
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Expense', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0), fontWeight:  FontWeight.bold),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),

                            //---Less Advance
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Less Advance', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0), fontWeight:  FontWeight.bold),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Colors.black,
                            ),

                            //---Reimbursable
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Reimbursable', style: TextStyle(fontSize: 16, color: Color.fromRGBO(
                                    26, 26, 26, 1.0), fontWeight:  FontWeight.bold),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 40,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      // Setting maxLines to null allows for unlimited lines
                                      decoration: kTextFieldDecorationExpense.copyWith(hintText: '0.0')
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  //---save/cancel btn, code starts
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black54), right: BorderSide(width: 1, color: Colors.black54))),
                          child: MaterialButton( onPressed: (){},child: Text('Cancel', style: TextStyle(fontSize: 15, color: Color.fromRGBO(
                              38, 38, 38, 1.0),),textAlign: TextAlign.center,)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black54))),
                          child: MaterialButton( onPressed: (){},child: Text('Save', style: TextStyle(fontSize: 15, color: Color.fromRGBO(
                              38, 38, 38, 1.0),),textAlign: TextAlign.center,)),
                        ),
                      )

                    ],
                  ),
                  //---save/cancel btn, code ends
                ],
              ),
            ),
          ),
        )
    );
  }
}
