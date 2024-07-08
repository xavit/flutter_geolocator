import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double latitude = 0.0;
  double longitude = 0.0;

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await _determinePosition();
    debugPrint('Location: ${position.latitude}, ${position.longitude}');
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Geolocator')),
        ),
        body: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Presiona el botón para obtener tu ubicación"),
              const SizedBox(height: 16),
              Text("Latitud: $latitude"),
              Text("Longitud: $longitude"),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // debugPrint("Obtener Ubicación");
                  getCurrentLocation();
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 8),
                    Text('Obtener Ubicación'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
