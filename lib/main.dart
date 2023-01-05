import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        backgroundColor: Color(0xFF060628),
        body: SafeArea(
          child: HomeScreen(),
          )
        ),
    )
  );
}

