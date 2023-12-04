

import 'package:flutter/material.dart';

const dropDownCustomDecoration = InputDecoration(
  fillColor: Colors.white,
  //Add isDense true and zero Padding.
  //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
  isDense: true,
  contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
  border:OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Color.fromRGBO(203, 203, 203, 1.0), width: 1.0)
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(203, 203, 203, 1.0), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(203, 203, 203, 1.0), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  //Add more decoration as you want here
  //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
);