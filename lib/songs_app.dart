import 'package:flutter/material.dart';
import 'package:songs_app/home_screen.dart';

class SongsApp extends StatelessWidget {
  const SongsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}