

import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  // const ExpenseForm({Key? key}) : super(key: key);
  static String id = 'ExpenseForm';

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
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
        ),

      ),
    );
  }
}
