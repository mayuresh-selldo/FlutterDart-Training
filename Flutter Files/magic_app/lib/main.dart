import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numOfImage = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Center(
            child: Text(
              "Magic 8 Ball App",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    'images/ball$numOfImage.png',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        numOfImage = Random().nextInt(5) + 1;
                      });
                    },
                    child: Text("Give me answer"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
