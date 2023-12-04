

import 'package:flutter/material.dart';

class ReusableDropDownFormField extends StatelessWidget {
  // const ReusableDropDownFormField({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> list;
  void Function(String?)? onChanged;
  void Function(String?)? onSaved;
  var dropDownCustomDecoration;
  var hintName;
  // GlobalKey<FormFieldState> key;
  Key key;
  ReusableDropDownFormField({required this.list, required this.onChanged, required this.onSaved, required this.dropDownCustomDecoration, required this.hintName, required this.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      key: key,
      items: list,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: dropDownCustomDecoration,
      hint: Text(hintName, style: TextStyle(fontSize: 14),),
      icon: Container(
        height: 30,
        width: 43,
        // color: Colors.blueAccent,
        child: Image.asset('images/arrowdn.png'),
      ),
      iconSize: 30,
      validator: (value) {
        if (value == null) {
          return 'Please select item.';
        }
      },
    );
  }
}
