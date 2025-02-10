import 'package:bmicalculator/reuseablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_widget.dart';

const bottomContainerHeight = 60.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseAbleCard(
                    colour: activeCardColor,
                    cardChild: GenderWidget(
                      iconName: FontAwesomeIcons.mars,
                      gender: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseAbleCard(
                    colour: activeCardColor,
                    cardChild: GenderWidget(
                      iconName: FontAwesomeIcons.venus,
                      gender: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUseAbleCard(colour: activeCardColor),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseAbleCard(colour: activeCardColor),
                ),
                Expanded(
                  child: ReUseAbleCard(colour: activeCardColor),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
            child: Center(
              child: Text(
                "Calculate your BMI",
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
