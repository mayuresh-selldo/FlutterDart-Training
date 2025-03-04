import 'package:flutter/material.dart';
import 'package:pre_project_practice/pages/login_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Login",
                ),
                Tab(
                  text: "Sign Up",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LoginPage(),
              Center(
                child: Text("Sign Up Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
