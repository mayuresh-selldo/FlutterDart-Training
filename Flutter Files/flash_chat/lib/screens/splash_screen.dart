import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Duration duration = Duration(seconds: 3);

  void reDirectToWelcomeScreen() {
    setState(() {
      Future.delayed(duration, () {
        if (mounted) {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => WelcomeScreen(),
            ),
          );
        }
      });
    });
  }

  // XYZ
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

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    reDirectToWelcomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
