import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'chat_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Duration duration = Duration(seconds: 3);

  PackageInfo _packageInfo = PackageInfo(
      appName: '', packageName: '', version: '', buildNumber: 'buildNumber');

  Future<void> _initPackageInfo() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _packageInfo = info;
      });
    }
  }

  Future<bool> _checkIfUserIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    if (isLoggedIn != null && isLoggedIn) {
      return true;
    }
    return false;
  }

  void redirectIfLoggedOrNot() async {
    bool isLoggedIn = await _checkIfUserIsLoggedIn();
    if (isLoggedIn) {
      reDirectTo(context, () => ChatScreen(), state: this);
    } else {
      reDirectTo(context, () => WelcomeScreen(), state: this);
    }
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(duration);
    redirectIfLoggedOrNot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              child: Image.asset('images/logo.png'),
              height: 180.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "V${_packageInfo.version}+${_packageInfo.buildNumber}",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
