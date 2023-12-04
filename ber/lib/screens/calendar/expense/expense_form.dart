

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

                  );
                }

            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
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

                        Text('Task', style: TextStyle(color: Color.fromRGBO(31, 31, 31, 1.0),fontSize: 16, fontWeight: FontWeight.w400)),
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
