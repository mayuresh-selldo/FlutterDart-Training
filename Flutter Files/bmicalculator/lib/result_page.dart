import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/input_page.dart';
import 'package:bmicalculator/reuseablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String weightCategory(double bmi) {
  if (bmi < 18.5) {
    return "UnderWeight";
  } else if (bmi >= 18.5 && bmi < 25) {
    return "Normal";
  } else if (bmi >= 25 && bmi < 30) {
    return "Overweight";
  } else if (bmi >= 30) {
    return "Obese";
  } else {
    return "Cant Categorize";
  }
}

class ResultPage extends StatelessWidget {
  final double? result;

  const ResultPage({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: Icon(FontAwesomeIcons.arrowLeft),
          //   color: Colors.white,
          // ),
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
        body: Expanded(
          child: ReUseAbleCard(
            colour: inActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Your BMI is ${result?.toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Category: ${weightCategory(result ?? 0.0)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
