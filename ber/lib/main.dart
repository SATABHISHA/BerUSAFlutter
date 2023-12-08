import 'package:ber/screens/calendar/calendar_day_selection.dart';
import 'package:ber/screens/calendar/calendar_home.dart';
import 'package:ber/screens/calendar/expense/expense_form.dart';
import 'package:ber/screens/calendar/expense/expense_summary.dart';
import 'package:ber/screens/calendar/expense/expense_type_entry.dart';
import 'package:ber/screens/login/user_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (context) => CalendarDataProvider(),
      child: MaterialApp(
        // title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: UserLogin(),
        initialRoute: UserLogin.id,
        routes: {
          UserLogin.id : (context) => UserLogin(),
          CalendarHome.id : (context) => CalendarHome(),
          CalendarDaySelection.id : (context) => CalendarDaySelection(),
          ExpenseForm.id : (context) => ExpenseForm(),
          ExpenseTypeEntry.id : (context) => ExpenseTypeEntry(),
          ExpenseSummary.id : (context) => ExpenseSummary(),
        },
      ),
    );
  }
}
