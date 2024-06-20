import 'package:flutter/material.dart';

class NoInterNetScreen extends StatefulWidget {
  const NoInterNetScreen({super.key});

  @override
  State<NoInterNetScreen> createState() => _NoInterNetScreenState();
}

class _NoInterNetScreenState extends State<NoInterNetScreen> {
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
        child: const Column(
         mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off,size: 300,),
            Text(
              "No Internet",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(height:20,),
            Text("Please Check You Internet Connection To Explore Funniest Joke Ever",style: TextStyle(color: Colors.white,fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
