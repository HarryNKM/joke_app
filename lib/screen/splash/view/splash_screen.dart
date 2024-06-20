import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
     Navigator.pushReplacementNamed(context, 'home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 40,
          bottom: 12,
        ),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.6),
            Colors.orange.withOpacity(0.8),
            Colors.deepOrange.withOpacity(0.8),
          ], begin: Alignment.center, end: Alignment.topCenter),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/img/emoji.png",
            ),
            const SizedBox(height: 20,),
            const Text(
              "Have Fun With Jokes Of The Year",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(height: 20,),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
              style: TextStyle(color: Colors.white54),
            )
          ],
        ),
      ),
    );
  }
}
