import 'package:flutter/material.dart';

// The Main Function is the starting point for all our apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("Hello World"),
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
            foregroundColor: Colors.white),
      ),
    ),
  );
}
