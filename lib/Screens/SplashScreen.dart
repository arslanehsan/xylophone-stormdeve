import 'dart:async';

import 'package:flutter/material.dart';

import '../Utils/ColorsAyesha.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int selectedIndex = 0;

  void loadSplash() {
    Timer(const Duration(seconds: 3), () {
      if (selectedIndex != 1) {
        setState(() {
          selectedIndex++;
        });
        loadSplash();
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    loadSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bgColor, body: _bodyView());
  }

  Widget _bodyView() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/SplashScreenDesign.png'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
