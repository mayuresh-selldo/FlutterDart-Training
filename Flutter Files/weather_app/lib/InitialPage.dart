import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Initialpage extends StatefulWidget {
  const Initialpage({super.key});

  @override
  State<Initialpage> createState() => _InitialpageState();
}

class _InitialpageState extends State<Initialpage> {
  Position? position;
  String address = "Location not yet obtained";

  Future<void> getLocationDetails() async {
    try {
      // Check and request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          position = currentPosition;
          address = '''
City: ${place.locality}
State: ${place.administrativeArea}
Country: ${place.country}
Postal Code: ${place.postalCode}
Street: ${place.street}
''';
        });
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather app"),
        backgroundColor: const Color(0xFF47BFDF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: getLocationDetails,
              child: const Text("Get Location Details"),
            ),
            const SizedBox(height: 20),
            if (position != null)
              Text(
                "Latitude: ${position!.latitude}\nLongitude: ${position!.longitude}",
              ),
            const SizedBox(height: 20),
            Text(address),
          ],
        ),
      ),
    );
  }
}
