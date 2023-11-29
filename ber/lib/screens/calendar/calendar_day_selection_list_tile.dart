

import 'package:flutter/material.dart';

class CalendarDaySelectionListTile extends StatelessWidget {
  // const CalendarDaySelectionListTile({Key? key}) : super(key: key);

  var weekDay, weekDayName;
  VoidCallback onPressedEditBtn;
  CalendarDaySelectionListTile({required this.weekDay, required this.weekDayName, required this.onPressedEditBtn});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      // height: 60,
      color: Color.fromRGBO(210, 208, 208, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Text('$weekDay', style: TextStyle(fontSize: 14,color: Color.fromRGBO(120, 120, 120, 1.0)),),
              SizedBox(width: 20,),
              Text('$weekDayName', style: TextStyle(fontSize: 14,color: Color.fromRGBO(120, 120, 120, 1.0)),),
              Expanded(child: Align(alignment: Alignment.centerRight,child: MaterialButton(onPressed: onPressedEditBtn, child: Text('Edit'))))
            ],
          )
        ],
      ),
    );
  }
}
