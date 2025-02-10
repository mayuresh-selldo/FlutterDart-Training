import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0xFF455A64),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0xFF455A64),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: InputPage(),
    );
  }
}
