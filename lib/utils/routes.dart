import 'package:flutter/material.dart';
import 'package:jokes_app/screen/home/view/home_screen.dart';
import 'package:jokes_app/screen/liked/view/liked_screen.dart';
import 'package:jokes_app/screen/nointernet/view/nointernet_screen.dart';
import 'package:jokes_app/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> app_routes={
  'home':(context)=>HomeScreen(),
  'nointernet':(context) => NoInterNetScreen(),
  'like':(context) => LikeScreen(),
  '/':(context)=>SplashScreen(),
};