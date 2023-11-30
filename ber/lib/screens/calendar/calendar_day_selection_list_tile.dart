

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
      color: Color.fromRGBO(253, 253, 253, 1.0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$weekDayName', style: TextStyle(fontSize: 17,color: Color.fromRGBO(
                        19, 19, 19, 1.0)),),
                    Text('$weekDay', style: TextStyle(fontSize: 15,color: Color.fromRGBO(120, 120, 120, 1.0)),),
                  ],

                ),
                SizedBox(width: 20,),

                Expanded(child: Align(alignment: Alignment.centerRight,child: MaterialButton(onPressed: onPressedEditBtn, child: Text('Edit'))))
              ],
            ),
            SizedBox(height: 5,),
            Container(width: MediaQuery.of(context).size.width, height: 0.5, color: Color.fromRGBO(
                134, 134, 134, 1.0),)
          ],
        ),
      ),
    );
  }
}
