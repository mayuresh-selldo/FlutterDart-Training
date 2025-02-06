import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) {
        print(message);
      }
    };
  }
  runApp(const XyloPhoneApp());
}

class XyloPhoneApp extends StatefulWidget {
  const XyloPhoneApp({super.key});

  @override
  State<XyloPhoneApp> createState() => _XyloPhoneAppState();
}

class _XyloPhoneAppState extends State<XyloPhoneApp> {
  final AudioPlayer player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playSound(int noteNumber) async {
    await player.stop(); // Stop any currently playing sound
    await player.play(AssetSource('audio/note$noteNumber.wav'));
  }

  Expanded buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () {
          playSound(noteNumber);
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Xylophone App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red, noteNumber: 1),
            buildKey(color: Colors.orange, noteNumber: 2),
            buildKey(color: Colors.yellow, noteNumber: 3),
            buildKey(color: Colors.green, noteNumber: 4),
            buildKey(color: Colors.teal, noteNumber: 5),
            buildKey(color: Colors.blue, noteNumber: 6),
            buildKey(color: Colors.purple, noteNumber: 7),
          ],
        ),
      ),
    );
  }
}
