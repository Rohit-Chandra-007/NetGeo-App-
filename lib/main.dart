import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_geo_app/HomeScreen/home_screen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        nextScreen: const HomeScreen(),
        splash: Hero(
            tag: 'net_geo', child: Image.asset('assets/images/net_geo.png')),
        centered: true,
        splashIconSize: 64,
        animationDuration: const Duration(seconds: 5),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
