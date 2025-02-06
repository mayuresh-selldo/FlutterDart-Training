import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/profile.jpg"),
              ),
              Text(
                "Mayuresh",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              Image.asset('images/xyz.webp'),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 2.5,
                  fontFamily: "SourceSans3",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white70,
                ),
              ),
              Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                      size: 25.0,
                    ),
                    title: Text(
                      "+91 91753 00000",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 18.0,
                      ),
                    ),
                  )),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal.shade900,
                    size: 25.0,
                  ),
                  title: Text(
                    "abc@gmail.com",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
