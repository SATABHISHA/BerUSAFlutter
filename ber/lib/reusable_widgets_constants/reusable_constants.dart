

import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
    hintText: 'Search Skill(s)',
    hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Gilroy'),
    filled: true,
    isDense: true,
    // contentPadding: const EdgeInsets.fromLTRB(-10, 20, 10, 0),
    // contentPadding: const EdgeInsetsDirectional.only(start: -50.0),
    contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(214, 213, 213, 1.0), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(214, 213, 213, 1.0), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    )
);