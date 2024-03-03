import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/screen1.dart';
import 'package:movies/sign_in.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => screen1(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        color: Colors.black,
        child: Center(
            child: Container(
                height: 400,
                width: 400,
                child: Image.asset('assets/images/1.webp'))
        ),
      ),
    );
  }
}