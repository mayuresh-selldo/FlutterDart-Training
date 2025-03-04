import 'package:flutter/material.dart';
import 'package:pre_project_practice/pages/landing_page.dart';

void main() {
  runApp(const PracticeApp());
}

class PracticeApp extends StatelessWidget {
  const PracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}
