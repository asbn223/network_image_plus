import 'package:flutter/material.dart';
import 'package:network_image_plus/network_image_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: NetworkImagePlus(
            url: 'https://example.com/image.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
