import 'package:flutter/material.dart';
import 'package:flutter_geolocator/ui/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocator App',
      home: const HomePage(),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
