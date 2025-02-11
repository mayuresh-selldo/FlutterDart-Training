import 'package:bmicalculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return InputPage();
                },
              ),
            );
          },
          child: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Your Result",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Text(
        "This is Result Page",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
